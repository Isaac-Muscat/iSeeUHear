import os
import cv2
import numpy as np
from PIL import Image, ImageFilter


img_l = Image.open("left_large.png").convert("L")
img_r = Image.open("right_large.png").convert("L")

img_l = img_l.resize((640, 480), Image.Resampling.LANCZOS)
img_r = img_r.resize((640, 480), Image.Resampling.LANCZOS)

img_l = img_l.filter(ImageFilter.GaussianBlur(radius=5))
img_r = img_r.filter(ImageFilter.GaussianBlur(radius=5))

img_l.save("left_large.bmp", format="BMP")
img_r.save("right_large.bmp", format="BMP")

