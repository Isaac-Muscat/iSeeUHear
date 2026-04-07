import os
import cv2
import numpy as np
from PIL import Image

# ==============================
# Configuration
# ==============================

INPUT_FOLDER = "data"     # folder to search
OUTPUT_FOLDER = "data_pfm"      # output root folder
RECURSIVE = True                  # search subdirectories


# ==============================
# PFM Writer
# ==============================

def save_pfm(filename, image, scale=1.0):
    """
    Save a numpy float32 image as PFM.
    """

    if image.dtype != np.float32:
        image = image.astype(np.float32)

    color = False
    if len(image.shape) == 3 and image.shape[2] == 3:
        color = True

    with open(filename, "wb") as f:
        # Header
        if color:
            f.write(b"PF\n")
        else:
            f.write(b"Pf\n")

        f.write(f"{image.shape[1]} {image.shape[0]}\n".encode())

        # Negative scale indicates little-endian
        endian = image.dtype.byteorder
        if endian == "<" or (endian == "=" and np.little_endian):
            scale = -scale

        f.write(f"{scale}\n".encode())

        # Flip vertically (PFM stores bottom-to-top)
        image_flipped = np.flipud(image)

        image_flipped.tofile(f)


# ==============================
# Conversion Function
# ==============================

def convert_png_to_pfm(input_root, output_root):

    for root, dirs, files in os.walk(input_root):
        for file in files:
            if file.lower().endswith(".png"):

                input_path = os.path.join(root, file)

                # Preserve folder structure
                relative_path = os.path.relpath(root, input_root)
                output_dir = os.path.join(output_root, relative_path)
                os.makedirs(output_dir, exist_ok=True)

                output_name = os.path.splitext(file)[0] + ".pfm"
                output_path = os.path.join(output_dir, output_name)

                print(f"Converting: {input_path}")

                # Load PNG as grayscale float32
                img = Image.open(input_path)
                img.save(output_path)


# ==============================
# Run
# ==============================

if __name__ == "__main__":

    if not os.path.exists(INPUT_FOLDER):
        raise RuntimeError("Input folder does not exist.")

    os.makedirs(OUTPUT_FOLDER, exist_ok=True)

    convert_png_to_pfm(INPUT_FOLDER, OUTPUT_FOLDER)

    print("Conversion complete.")

