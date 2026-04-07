import os
from PIL import Image

# ==============================
# Configuration
# ==============================

INPUT_FOLDER = "data_bmp_160x120_nearest_grayscale"
OUTPUT_FOLDER = "data_carray_160x120_nearest_grayscale"
RECURSIVE = True


# ==============================
# BMP → Grayscale C Array Conversion
# ==============================

def bmp_to_c_array(image_path, output_path, array_name):
    img = Image.open(image_path)
    img = img.convert("L")  # Convert to 8-bit grayscale

    pixels = list(img.getdata())
    width, height = img.size

    with open(output_path, "w") as f:

        f.write(f"#ifndef {array_name.upper()}_H\n")
        f.write(f"#define {array_name.upper()}_H\n\n")

        f.write(f"#define {array_name.upper()}_WIDTH {width}\n")
        f.write(f"#define {array_name.upper()}_HEIGHT {height}\n\n")

        f.write(f"const unsigned char {array_name}[{width * height}] = {{\n")

        for i, gray in enumerate(pixels):
            f.write(f"0x{gray:02x}, ")

            # 16 pixels per line for readability
            if (i + 1) % 16 == 0:
                f.write("\n")

        f.write("\n};\n\n#endif\n")

    print(f"Generated grayscale C array: {output_path}")
    print(f"Resolution: {width} x {height}")
    print(f"Total pixels: {width * height}")


# ==============================
# Main
# ==============================

if __name__ == "__main__":

    if not os.path.exists(INPUT_FOLDER):
        raise RuntimeError("Input folder does not exist.")

    bmp_files = []

    for root, dirs, files in os.walk(INPUT_FOLDER):
        for file in files:
            if file.lower().endswith(".bmp"):
                bmp_files.append(os.path.join(root, file))

        if not RECURSIVE:
            break

    for bmp_path in bmp_files:

        relative_dir = os.path.relpath(os.path.dirname(bmp_path), INPUT_FOLDER)
        output_dir = os.path.join(OUTPUT_FOLDER, relative_dir)
        os.makedirs(output_dir, exist_ok=True)

        array_name = os.path.splitext(os.path.basename(bmp_path))[0]
        header_name = array_name + ".h"
        header_path = os.path.join(output_dir, header_name)

        print(f"Converting BMP → Grayscale C Array: {bmp_path}")
        bmp_to_c_array(bmp_path, header_path, array_name)

    print("Conversion complete.")
