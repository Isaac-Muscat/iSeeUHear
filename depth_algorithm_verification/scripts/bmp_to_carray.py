import os
from PIL import Image

# ==============================
# Configuration
# ==============================

INPUT_FOLDER = "data_bmp"
OUTPUT_FOLDER = "data_carray"
RECURSIVE = True


# ==============================
# BMP → C Array Conversion
# ==============================

def bmp_to_c_array(image_path, output_path, array_name):
    img = Image.open(image_path)
    img = img.convert("RGB")  # Ensure 24-bit RGB

    pixels = list(img.getdata())
    width, height = img.size

    with open(output_path, "w") as f:

        f.write(f"#ifndef {array_name.upper()}_H\n")
        f.write(f"#define {array_name.upper()}_H\n\n")

        f.write(f"#define {array_name.upper()}_WIDTH {width}\n")
        f.write(f"#define {array_name.upper()}_HEIGHT {height}\n\n")

        f.write(f"const unsigned char {array_name}[{width * height * 3}] = {{\n")

        count = 0
        for r, g, b in pixels:
            f.write(f"0x{r:02x}, 0x{g:02x}, 0x{b:02x}, ")
            count += 1

            if count % 8 == 0:
                f.write("\n")

        f.write("\n};\n\n#endif\n")

    print(f"Generated C array: {output_path}")


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

                input_path = os.path.join(root, file)

                # Preserve folder structure
                relative_path = os.path.relpath(root, INPUT_FOLDER)
                output_dir = os.path.join(OUTPUT_FOLDER, relative_path)
                os.makedirs(output_dir, exist_ok=True)

                output_name = os.path.splitext(file)[0] + ".bmp"
                output_path = os.path.join(output_dir, output_name)

                img = Image.open(input_path)
                bmp_files.append(input_path)

    for bmp_path in bmp_files:

        array_name = os.path.splitext(os.path.basename(bmp_path))[0]
        header_name = array_name + ".h"
        header_path = os.path.join(OUTPUT_FOLDER, os.path.join(os.path.relpath(os.path.dirname(bmp_path), INPUT_FOLDER), header_name))

        print(header_path)
        print(f"Converting BMP → C Array: {bmp_path}")
        bmp_to_c_array(bmp_path, header_path, array_name)

    print("Conversion complete.")
