LOCAL_PATH := device/lge/m253

# Architecture
ifeq ($(m253_32_BUILD),true)
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
else
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
endif

# Board
TARGET_BOOTLOADER_BOARD_NAME := mt6735
TARGET_BOARD_PLATFORM := mt6735
TARGET_NO_BOOTLOADER := true
ifneq ($(m253_32_BUILD),true)
TARGET_IS_64_BIT := true
endif

# Kernel
ifeq ($(m253_32_BUILD),true)
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2
else
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
endif

BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
ifeq ($(m253_32_BUILD),true)
TARGET_PREBUILT_KERNEL := device/lge/m253/prebuilt/recovery.img-zImage
else
TARGET_PREBUILT_KERNEL := device/lge/m253/prebuilt/Image.gz
endif
BOARD_MKBOOTIMG_ARGS := \
    --board $(TARGET_BOARD_PLATFORM) \
    --kernel_offset 0x00008000 \
    --pagesize 2048

ifeq ($(m253_32_BUILD),true)
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
BOARD_MKBOOTIMG_ARGS += \
    --base 0x40000000 \
    --ramdisk_offset 0x04000000 \
    --second_offset 0x00f00000 \
    --tags_offset 0x0e000000
else
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_MKBOOTIMG_ARGS += \
    --base 0x40078000 \
    --ramdisk_offset 0x3F88000 \
    --second_offset 0xE88000 \
    --tags_offset 0xDF88000
endif

# Partitons
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 131072

#Ignore Missing Dependencies
ALLOW_MISSING_DEPENDENCIES=true

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/root/etc/twrp.stock
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_TWRPAPP := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_CRYPTO := true
TW_THEME := portrait_hdpi
TW_USE_TOOLBOX := true
# SHRP Configuration
SHRP_MAINTAINER := GuilianoS
SHRP_DEVICE_CODE := m253
SHRP_EDL_MODE := 0
SHRP_EXTERNAL := /external_sd
SHRP_INTERNAL := /sdcard
SHRP_OTG := /usb-otg
SHRP_CUSTOM_FLASHLIGHT := true
SHRP_FLASH := 1
SHRP_FLASH_MAX_BRIGHTNESS := 200
SHRP_FONP_1 := /proc/torch
SHRP_FONP_2 := /proc/torch
SHRP_FONP_3 := /proc/torch
SHRP_REC := /dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery
SHRP_AB := false 
# Recovery Type (It can be treble,normal,SAR) [Only for About Section]
SHRP_REC_TYPE := normal
# Recovery Type (It can be A/B or A_only) [Only for About Section]
SHRP_DEVICE_TYPE := A_Only
SHRP_EXPRESS := true
SHRP_OFFICIAL := false
SHRP_DARK := true
