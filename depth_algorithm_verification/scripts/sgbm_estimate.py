import numpy as np
from PIL import Image
import os

# ==============================
# Configuration
# ==============================
LEFT_PATH  = 'data/ladder1/im0.png'
RIGHT_PATH = 'data/ladder1/im1.png'
OUTPUT_DIR = "sgbm_output"
os.makedirs(OUTPUT_DIR, exist_ok=True)

MAX_DISPARITY = 64  # maximum disparity in pixels
BLOCK_SIZE = 5      # size of square window for initial matching
P1 = 10             # small smoothness penalty
P2 = 120            # large smoothness penalty

# ==============================
# Load images as grayscale
# ==============================
left_img  = np.array(Image.open(LEFT_PATH).convert("L"), dtype=np.float32)
right_img = np.array(Image.open(RIGHT_PATH).convert("L"), dtype=np.float32)

height, width = left_img.shape
half_block = BLOCK_SIZE // 2

# ==============================
# Step 1: Compute matching cost (SAD)
# ==============================
print("Computing initial SAD cost volume...")
cost_volume = np.full((height, width, MAX_DISPARITY), np.inf, dtype=np.float32)

for y in range(half_block, height - half_block):
    print(y, end=" ", flush=True)
    for x in range(half_block, width - half_block):
        left_block = left_img[y - half_block : y + half_block + 1,
                              x - half_block : x + half_block + 1]

        for d in range(MAX_DISPARITY):
            if x - half_block - d < 0:
                continue
            right_block = right_img[y - half_block : y + half_block + 1,
                                    x - half_block - d : x + half_block + 1 - d]
            sad = np.sum(np.abs(left_block - right_block))
            cost_volume[y, x, d] = sad

# ==============================
# Step 2: Aggregate costs along paths (simplified 4 directions)
# ==============================
print("Aggregating costs along paths...")
aggregated = cost_volume.copy()

directions = [
    (0, 1),    # left -> right
    (0, -1),   # right -> left
    (1, 0),    # top -> bottom
    (-1, 0)    # bottom -> top
]

for dy, dx in directions:
    print(dy, dx)
    for y in range(half_block, height - half_block):
        for x in range(half_block, width - half_block):
            if 0 <= y - dy < height and 0 <= x - dx < width:
                prev_cost = aggregated[y - dy, x - dx, :]
                # Add smoothness penalties
                new_cost = cost_volume[y, x, :] + prev_cost
                # Optional: add P1/P2 for disparity changes
                aggregated[y, x, :] = new_cost

# ==============================
# Step 3: Compute disparity by winner-takes-all
# ==============================
print("Computing final disparity map...")
disparity_map = np.argmin(aggregated, axis=2).astype(np.float32)

# ==============================
# Step 4: Normalize and save
# ==============================
disp_vis = (disparity_map / MAX_DISPARITY * 255).astype(np.uint8)
Image.fromarray(disp_vis).save(os.path.join(OUTPUT_DIR, "disparity_sgbm.png"))

print(f"SGBM disparity map saved in {OUTPUT_DIR}")

