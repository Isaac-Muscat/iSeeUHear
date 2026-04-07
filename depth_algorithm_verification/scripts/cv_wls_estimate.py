import cv2
import numpy as np
#from google.colab.patches import cv2_imshow

# Load rectified stereo pair
left = cv2.imread('data/artroom1/im0.png', cv2.IMREAD_GRAYSCALE)
right = cv2.imread('data/artroom1/im1.png', cv2.IMREAD_GRAYSCALE)

#left = cv2.imread('left.bmp', cv2.IMREAD_GRAYSCALE)
#right = cv2.imread('right.bmp', cv2.IMREAD_GRAYSCALE)

#height, width = right.shape
#print(width, height)
#
#
#translation_matrix = np.float32([
#    [1, 0, 0],
#    [0, 1, 7]
#])
#right = cv2.warpAffine(right, translation_matrix, (width, height))

# Compute disparity
stereo = cv2.StereoSGBM_create(
    minDisparity=0,
    numDisparities=16*5,  # must be divisible by 16
    blockSize=7,
    uniquenessRatio=10,
    speckleWindowSize=100,
    speckleRange=32,
    disp12MaxDiff=1
)

disparity = stereo.compute(right, left).astype(np.float32) / 16.0

# Normalize for display
disp_vis = cv2.normalize(disparity, None, 0, 255, cv2.NORM_MINMAX)
disp_vis = np.uint8(disp_vis)


print("Disparity Map:")
cv2.imwrite("disparity_output.png", disp_vis)

# SGBM parameters
num_disp = 16 * 8
block_size = 9
uniqueness_ratio = 8
speckle_window_size = 100
speckle_range = 32
disp12_max_diff = 1

# Left matcher
stereo = cv2.StereoSGBM_create(
    minDisparity=0,
    numDisparities=num_disp,
    blockSize=block_size,
    uniquenessRatio=uniqueness_ratio,
    speckleWindowSize=speckle_window_size,
    speckleRange=speckle_range,
    disp12MaxDiff=disp12_max_diff
)
disparity = stereo.compute(left, right).astype(np.float32) / 16.0

# Right matcher
stereo_r = cv2.StereoSGBM_create(
    minDisparity=-num_disp,
    numDisparities=num_disp,
    blockSize=block_size,
    uniquenessRatio=uniqueness_ratio,
    speckleWindowSize=speckle_window_size,
    speckleRange=speckle_range,
    disp12MaxDiff=disp12_max_diff
)
disparity_r = stereo_r.compute(right, left).astype(np.float32) / 16.0

# WLS filter
lmbda = 8000.0
sigma = 1.5

# Create filter
wls_filter = cv2.ximgproc.createDisparityWLSFilter(matcher_left=stereo)
wls_filter.setLambda(lmbda)
wls_filter.setSigmaColor(sigma)

# Apply filter
filtered_disp_int = wls_filter.filter(
    (disparity * 16).astype(np.int16),
    left,
    disparity_map_right=(disparity_r * 16).astype(np.int16)
)

# Convert disparity
filtered_disp = filtered_disp_int.astype(np.float32) / 16.0

# Show disparity
print("Final Smoothed Disparity Map (Brighter = Closer):")
cv2.imwrite("disparity_wls_output.png", cv2.normalize(filtered_disp, None, 0, 255, cv2.NORM_MINMAX).astype(np.uint8))
#cv2_imshow(cv2.normalize(filtered_disp, None, 0, 255, cv2.NORM_MINMAX).astype(np.uint8))
