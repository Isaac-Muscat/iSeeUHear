import os
from PIL import Image

# ==============================
# Configuration
# ==============================

INPUT_FOLDER = "data_bmp_80x60_nearest_grayscale"
OUTPUT_FOLDER = "data_coe_80x60_nearest_grayscale"
RECURSIVE = True

WORDS_PER_LINE = 4   # <<<<< 4 x 32-bit words per line


# ==============================
# BMP → 32-bit Packed Grayscale COE
# ==============================

def bmp_to_coe(image_path, output_path):
    img = Image.open(image_path)
    img = img.convert("L")  # 8-bit grayscale

    width, height = img.size
    pixels = list(img.getdata())

    # Ensure width is divisible by 4 (required for clean row packing)
    if width % 4 != 0:
        raise RuntimeError("Image width must be divisible by 4 for 32-bit packing per row.")

    with open(output_path, "w") as f:

        f.write("memory_initialization_radix=16;\n")
        f.write("memory_initialization_vector=\n")

        total_words = 0

        for row in range(height):

            row_start = row * width
            row_pixels = pixels[row_start:row_start + width]

            # Pack this row
            row_words = []
            for i in range(0, width, 4):
                p0 = row_pixels[i + 0]
                p1 = row_pixels[i + 1]
                p2 = row_pixels[i + 2]
                p3 = row_pixels[i + 3]

                word = (p0 << 24) | (p1 << 16) | (p2 << 8) | p3
                row_words.append(word)

            # Write row words with 4 per line
            for i, word in enumerate(row_words):
                hex_word = f"{word:08X}"

                is_last_word = (
                    row == height - 1 and
                    i == len(row_words) - 1
                )

                if (i % WORDS_PER_LINE) == WORDS_PER_LINE - 1 or i == len(row_words) - 1:
                    # End of line
                    if is_last_word:
                        f.write(hex_word + ";\n")
                    else:
                        f.write(hex_word + ",\n")
                else:
                    f.write(hex_word + ", ")

                total_words += 1

        print(f"Generated COE: {output_path}")
        print(f"Resolution: {width} x {height}")
        print(f"Total 32-bit words: {total_words}")


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

        name = os.path.splitext(os.path.basename(bmp_path))[0]
        coe_path = os.path.join(output_dir, name + ".coe")

        print(f"Converting BMP → 32-bit Packed COE: {bmp_path}")
        bmp_to_coe(bmp_path, coe_path)

    print("Conversion complete.")
