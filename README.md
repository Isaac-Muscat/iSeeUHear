# iSeeUhear - Image data to 3D sound
This project is the result of a course project from ECE532 at the University of Toronto. iSeeUhear uses a Nexys4 DDR Board with supporting hardware peripherals. Two cameras capture visual input, forwarding to a stereovision algorithm that calculates object depth. Results are displayed on a VGA graphical interface for debugging, while a 3D audio algorithm generates pitch-varied spatial audio to help users identify the nearest object.

## Project Demo
https://www.youtube.com/watch?v=gOi1m2fX8pc

## Project Structure
```
    .
    ├── depth_algorithm_verification                                 # Depth algorithm verification directory
    │   ├── data                                                     # Stereo depth data used for algorithm verification
    │   ├── scripts                                                  # A variety of scripts used for testing, debug, and validation
    │   ├── vivado_tflite_runtime_proj                               # Sub-project used while getting tflite-micro to run on microblaze
    │   |   ├── ml_microblaze_opt.sdk/fastdepth_runtime/src/main.cc  # Tflite-micro c test
    │   |   └── ml_microblaze_opt.sdk/tflm-tree                      # Modified Tflite-micro for microblaze
    │   └── vivado_axi_stereo_proj                                   # Sub-project used to validate the depth algorithm IP
    ├── ip_repo
    │   ├── axi_if_depth_algo_1.0                                    # Custom Depth Algorithm IP
    │   └── axi_sum_reg_1.0
    ├── vivado_main_proj                                             # Main vivado project used for demo
    │   ├── project_camera.sdk/iSeeUhear/src
    |       └── helloworld.c                                         # Microblaze main C-code
    │   └── project_camera.srcs/sources_1/new
    │       ├── VGA_controller.v                                    # Custom VGA IP
    │       ├── colour_mapper.v                                     # Custom VGA IP
    │       ├── pmod_cam.v                                          # Custom Camera IP
    |       └── tid_preamble_gen.v                                  # Custom Audio IP
    └── 

```
