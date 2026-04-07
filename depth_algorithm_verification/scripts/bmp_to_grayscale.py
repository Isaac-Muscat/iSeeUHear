import os
from PIL import Image

# ==============================
# Configuration
# ==============================

INPUT_FOLDER = "data_bmp_80x60_nearest"
OUTPUT_FOLDER = "data_bmp_80x60_nearest_grayscale"
RECURSIVE = True


# ==============================
# BMP → Grayscale Conversion
# ==============================

def convert_to_grayscale(input_path, output_path):
    img = Image.open(input_path)

    # Convert to 8-bit grayscale
    gray_img = img.convert("L")

    # Ensure output directory exists
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    # Save as BMP
    gray_img.save(output_path, format="BMP")

    print(f"Converted: {input_path} → {output_path}")
    print(f"Resolution: {gray_img.size[0]} x {gray_img.size[1]}")


# ==============================
# Main
# ==============================

if __name__ == "__main__":

    if not os.path.exists(INPUT_FOLDER):
        raise RuntimeError("Input folder does not exist.")

    for root, dirs, files in os.walk(INPUT_FOLDER):

        for file in files:
            if file.lower().endswith(".bmp"):

                input_path = os.path.join(root, file)

                # Preserve folder structure
                relative_path = os.path.relpath(root, INPUT_FOLDER)
                output_dir = os.path.join(OUTPUT_FOLDER, relative_path)
                output_path = os.path.join(output_dir, file)

                convert_to_grayscale(input_path, output_path)

        if not RECURSIVE:
            break

    print("All BMP files converted to grayscale.")
