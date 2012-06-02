# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false
BOARD_USE_FROYO_LIBCAMERA := true
JS_ENGINE:=v8

# inherit from the proprietary version
-include vendor/htc/espresso/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := device/htc/espresso/include

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := msm7x27
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi

TARGET_BOOTLOADER_BOARD_NAME := latte

TARGET_PROVIDES_INIT_TARGET_RC := true

TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WLAN_DEVICE           := wl1271
#BOARD_SOFTAP_DEVICE         := wl1271
WPA_SUPPLICANT_VERSION      := VER_0_6_X
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/tiwlan_drv.ko"
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := "tiwlan_drv"
WIFI_EXT_MODULE_PATH        := "/system/lib/modules/sdio.ko"
WIFI_EXT_MODULE_NAME        := "sdio"
WIFI_FIRMWARE_LOADER        := "wlan_loader"

BOARD_USES_GENERIC_AUDIO := false

BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_BASE := 0x12c00000

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := false

BOARD_HAVE_FM_RADIO := false

BOARD_VENDOR_QCOM_AMSS_VERSION := 4735

BOARD_VENDOR_USE_AKMD := akm8973

BOARD_EGL_CFG := device/htc/espresso/prebuilt/lib/egl/egl.cfg

BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true

BOARD_USE_NEW_LIBRIL_HTC := true

BOARD_NO_RGBX_8888 := true

BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := latte
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 20000
BOARD_USES_QCOM_LIBRPC := true

# # cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 000a0000 00020000 "misc"
# mtd1: 00420000 00020000 "recovery"
# mtd2: 002c0000 00020000 "boot"
# mtd3: 0f000000 00020000 "system"
# mtd4: 05000000 00020000 "cache"
# mtd5: 09120000 00020000 "userdata"

# For some reason the kernel is bigger now, and the old size limits are too small
# It still flashes the bigger image perfectly fine, despite make saying it's too big
# Raise the limit (for now) so it will build
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00340000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
#BOARD_BOOTIMAGE_PARTITION_SIZE := 0x002c0000
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00420000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0f000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x01920000

BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

TARGET_KERNEL_SOURCE := kernel/htc/msm7227
TARGET_KERNEL_CONFIG := cyanogen_msm7227_defconfig
TARGET_PREBUILT_KERNEL := device/htc/espresso/prebuilt/kernel

#TARGET_PREBUILT_RECOVERY_KERNEL := device/htc/espresso/prebuilt/recovery_kernel
#BOARD_USES_RECOVERY_CHARGEMODE := true
#TARGET_RECOVERY_INITRC := device/htc/espresso/init.recovery.rc
#BOARD_HAS_NO_SELECT_BUTTON := true

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file

# Fix for Atmel touchscreens; trackball button
BOARD_USE_LEGACY_TOUCHSCREEN := true
BOARD_USE_LEGACY_TRACKPAD := true

HTTP := chrome
WITH_JIT := true
ENABLE_JSC_JIT := true

COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DREFRESH_RATE=60
USE_OPENGL_RENDERER := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
TARGET_USES_GENLOCK := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true

# Needed for camera
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
