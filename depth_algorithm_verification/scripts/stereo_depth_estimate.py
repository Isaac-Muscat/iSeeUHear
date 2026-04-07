import cv2
import numpy as np
import os
import time

# ==============================
# Configuration
# ==============================

LEFT_PATH  = 'data/artroom1/im0.png'
RIGHT_PATH = 'data/artroom1/im1.png'
OUTPUT_DIR = 'stereo_output_pure_python'
SCALE = 0.25

BLOCK_SIZE = 7
MAX_DISPARITY = 32   # keep small for runtime

os.makedirs(OUTPUT_DIR, exist_ok=True)

# ==============================
# Load Images
# ==============================

left  = cv2.imread(LEFT_PATH,  cv2.IMREAD_GRAYSCALE)
right = cv2.imread(RIGHT_PATH, cv2.IMREAD_GRAYSCALE)

if left is None or right is None:
    raise RuntimeError("Error loading images")

#if SCALE != 1.0:
#    left  = cv2.resize(left,  None, fx=SCALE, fy=SCALE)
#    right = cv2.resize(right, None, fx=SCALE, fy=SCALE)
#
#cv2.imwrite(os.path.join(OUTPUT_DIR, "left_resized.png"), left)
#cv2.imwrite(os.path.join(OUTPUT_DIR, "right_resized.png"), right)

height, width = left.shape
print(width, height)
half = BLOCK_SIZE // 2

# ==============================
# SAD Block Matching
# ==============================

print("Computing disparity (pure Python SAD)...")
start_time = time.time()

disparity = np.zeros((height, width), dtype=np.float32)

for y in range(half, height - half):
    for x in range(half + MAX_DISPARITY, width - half):

        best_d = 0
        best_cost = 1e9

        left_block = left[y-half:y+half+1, x-half:x+half+1]

        for d in range(MAX_DISPARITY):

            xr = x - d
            if xr - half < 0:
                continue

            right_block = right[y-half:y+half+1, xr-half:xr+half+1]

            sad = np.sum(np.abs(left_block.astype(np.int32) - right_block.astype(np.int32)))

            if sad < best_cost:
                best_cost = sad
                best_d = d
            


        disparity[y, x] = best_d
    print(y)

end_time = time.time()
print("Disparity computation time:", end_time - start_time, "seconds")

np.save(os.path.join(OUTPUT_DIR, "disparity_raw.npy"), disparity)

# Normalize for visualization
disp_vis = (disparity / MAX_DISPARITY * 255).astype(np.uint8)
cv2.imwrite(os.path.join(OUTPUT_DIR, "disparity_raw.png"), disp_vis)

# ==============================
# Median Filter (Pure Python)
# ==============================

print("Applying median filter...")
start_time = time.time()

filtered = np.zeros_like(disparity)
f_half = 7  # 5x5 filter

for y in range(f_half, height - f_half):
    for x in range(f_half, width - f_half):

        window = disparity[y-f_half:y+f_half+1, x-f_half:x+f_half+1]
        filtered[y, x] = np.median(window)

end_time = time.time()
print("Median filter time:", end_time - start_time, "seconds")

np.save(os.path.join(OUTPUT_DIR, "disparity_filtered.npy"), filtered)

filtered_vis = (filtered / MAX_DISPARITY * 255).astype(np.uint8)
cv2.imwrite(os.path.join(OUTPUT_DIR, "disparity_filtered.png"), filtered_vis)

# ==============================
# Save Debug Info
# ==============================

log_path = os.path.join(OUTPUT_DIR, "debug_log.txt")

with open(log_path, "w") as f:
    f.write("Pure Python Stereo Debug\n")
    f.write("========================\n\n")
    f.write(f"Image shape: {left.shape}\n")
    f.write(f"Block size: {BLOCK_SIZE}\n")
    f.write(f"Max disparity: {MAX_DISPARITY}\n\n")
    f.write(f"Min disparity: {np.min(disparity)}\n")
    f.write(f"Max disparity: {np.max(disparity)}\n")
    f.write(f"Mean disparity: {np.mean(disparity)}\n")

print("Processing complete.")
print("Results saved to:", OUTPUT_DIR)

