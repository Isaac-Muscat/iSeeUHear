import os
from PIL import Image

# ==============================
# Configuration
# ==============================

#INPUT_COE = "/mnt/c/Users/isaac/Dev/FPGA/ece532/stereo_depth_verification/stereo_depth_verification.sim/sim_1/behav/xsim/bram_dump_vmem.hex"
#INPUT_COE = "/mnt/c/Users/isaac/Dev/FPGA/ece532/axi_stereo_verif/axi_stereo_verif.sim/sim_1/behav/xsim/bram_dump_vmem.hex"
#INPUT_COE = "data_coe_80x60_nearest_grayscale/artroom1/im0.coe"
INPUT_COE = "data_coe_160x120_nearest_grayscale/curule1/im0.coe"
OUTPUT_BMP = "output.bmp"

# WIDTH = ORIG_WIDTH - MAX_DISPARITY - BLOCKSIZE
# HEIGHT = ORIG_HEIGHT - BLOCKSIZE + 1
IMAGE_WIDTH =  136    # <-- set this
IMAGE_HEIGHT = 113    # <-- set this


# ==============================
# COE → BMP Conversion
# ==============================

def read_coe_32bit(path):
    with open(path, "r") as f:
        lines = f.readlines()

    # Find start of memory vector
    start_index = None
    for i, line in enumerate(lines):
        if "memory_initialization_vector" in line:
            start_index = i + 1
            break

    if start_index is None:
        print("No memory_initializatio_vector so assuming from fpga")

    words = []

    for line in lines[start_index:]:
        line = line.strip()

        # Remove trailing semicolon
        if line.endswith(";"):
            line = line[:-1]

        if line:
            values = line.split(",")
            for v in values:
                v = v.strip()
                if v != "":
                    words.append(int(v, 16))

    return words


def unpack_pixels(words):
    pixels = []

    for word in words:
        print(hex(word))
        p0 = (word >> 24) & 0xFF
        p1 = (word >> 16) & 0xFF
        p2 = (word >> 8)  & 0xFF
        p3 =  word        & 0xFF

        pixels.extend([p0, p1, p2, p3])

    return pixels


def coe_to_bmp(input_coe, output_bmp, width, height):
    words = read_coe_32bit(input_coe)
    pixels = unpack_pixels(words)

    expected_pixels = width * height

    if len(pixels) < expected_pixels:
        raise RuntimeError(
            f"Not enough pixels. Expected {expected_pixels}, got {len(pixels)}"
        )

    # Trim padding if present
    pixels = pixels[:expected_pixels]

    img = Image.new("L", (width, height))
    img.putdata(pixels)
    img.save(output_bmp, format="BMP")

    print(f"Generated BMP: {output_bmp}")
    print(f"Resolution: {width} x {height}")
    print(f"Total 32-bit words read: {len(words)}")


# ==============================
# Main
# ==============================

if __name__ == "__main__":
    coe_to_bmp(INPUT_COE, OUTPUT_BMP, IMAGE_WIDTH, IMAGE_HEIGHT)
