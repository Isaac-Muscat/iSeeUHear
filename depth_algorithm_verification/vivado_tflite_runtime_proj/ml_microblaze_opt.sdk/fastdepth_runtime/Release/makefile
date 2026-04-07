################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include tflm-tree/third_party/kissfft/tools/subdir.mk
-include tflm-tree/third_party/kissfft/subdir.mk
-include tflm-tree/tensorflow/lite/micro/tflite_bridge/subdir.mk
-include tflm-tree/tensorflow/lite/micro/models/subdir.mk
-include tflm-tree/tensorflow/lite/micro/memory_planner/subdir.mk
-include tflm-tree/tensorflow/lite/micro/kernels/subdir.mk
-include tflm-tree/tensorflow/lite/micro/arena_allocator/subdir.mk
-include tflm-tree/tensorflow/lite/micro/subdir.mk
-include tflm-tree/tensorflow/lite/kernels/internal/reference/subdir.mk
-include tflm-tree/tensorflow/lite/kernels/internal/subdir.mk
-include tflm-tree/tensorflow/lite/kernels/subdir.mk
-include tflm-tree/tensorflow/lite/core/c/subdir.mk
-include tflm-tree/tensorflow/lite/core/api/subdir.mk
-include tflm-tree/tensorflow/compiler/mlir/lite/schema/subdir.mk
-include tflm-tree/tensorflow/compiler/mlir/lite/core/api/subdir.mk
-include tflm-tree/signal/src/kiss_fft_wrappers/subdir.mk
-include tflm-tree/signal/src/subdir.mk
-include tflm-tree/signal/micro/kernels/subdir.mk
-include src/subdir.mk
-include models/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
fastdepth_runtime.elf.size \


# All Target
all: fastdepth_runtime.elf secondary-outputs

# Tool invocations
fastdepth_runtime.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze g++ linker'
	mb-g++ -Wl,-T -Wl,../src/lscript.ld -L../../fastdepth_runtime_bsp/microblaze_0/lib -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -Wl,--gc-sections -o "fastdepth_runtime.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

fastdepth_runtime.elf.size: fastdepth_runtime.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size fastdepth_runtime.elf  |tee "fastdepth_runtime.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(CC_DEPS)$(EXECUTABLES)$(OBJS)$(C_UPPER_DEPS)$(CXX_DEPS)$(S_UPPER_DEPS)$(C_DEPS)$(CPP_DEPS)$(ELFSIZE) fastdepth_runtime.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
