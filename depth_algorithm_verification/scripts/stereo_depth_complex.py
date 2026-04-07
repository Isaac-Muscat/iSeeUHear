import cv2
import numpy as np

# -----------------------------
# Load grayscale images
# -----------------------------
img_left = cv2.imread('left.bmp', cv2.IMREAD_GRAYSCALE)
img_right = cv2.imread('right.bmp', cv2.IMREAD_GRAYSCALE)

cv2.imwrite("depth_map.png", img_left)

if img_left is None or img_right is None:
    raise ValueError("Error loading images")

# -----------------------------
# Compute disparity (better method)
# -----------------------------
stereo = cv2.StereoSGBM_create(
    minDisparity=0,
    numDisparities=16*8,  # must be divisible by 16
    blockSize=5,
    P1=8 * 1 * 5**2,
    P2=32 * 1 * 5**2,
    mode=cv2.STEREO_SGBM_MODE_SGBM_3WAY
)

disparity = stereo.compute(img_left, img_right).astype(np.float32) / 16.0

# -----------------------------
# Convert disparity to depth
# -----------------------------
focal_length = 700.0   # pixels (adjust if known)
baseline = 0.1         # meters (adjust if known)

# Avoid invalid values
disparity[disparity <= 0] = 0.1

depth_map = (focal_length * baseline) / disparity

# -----------------------------
# Normalize depth for saving
# -----------------------------
depth_norm = cv2.normalize(depth_map, None, 0, 255, cv2.NORM_MINMAX)
depth_uint8 = depth_norm.astype(np.uint8)

# -----------------------------
# Save image
# -----------------------------
cv2.imwrite("depth_map.png", depth_uint8)

print("Depth map saved as depth_map.png")
