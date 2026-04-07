from PIL import Image


LEFT_BUF = "/mnt/c/Users/isaac/Dev/FPGA/ece532/stereo_depth_verification/stereo_depth_verification.sim/sim_1/behav/xsim/left_buf.hex"
RIGHT_BUF = "/mnt/c/Users/isaac/Dev/FPGA/ece532/stereo_depth_verification/stereo_depth_verification.sim/sim_1/behav/xsim/right_buf.hex"
LWIDTH = 8
LHEIGHT = 8 
RWIDTH = 8 + 16
RHEIGHT = 8 

def bytes_to_bmp(input_file, output_file, width, height):
    with open(input_file, "r") as f:
        lines = f.readlines()
        img_arr = []
        for i in range(width*height):
            print(i)
            img_arr.append(int(lines[i].strip(), 16))

        img = Image.new("L", (width, height))
        img.putdata(img_arr)
        img.save(output_file, format="BMP")

bytes_to_bmp(LEFT_BUF, "left_buf.bmp", LWIDTH, LHEIGHT)
bytes_to_bmp(RIGHT_BUF, "right_buf.bmp", RWIDTH, RHEIGHT)

