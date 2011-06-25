# Copyright (c) 2009, Code Aurora Forum.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# config.mk
#
# Product-specific compile-time definitions.
#
#######   for use when building CyanogenMod
USE_CAMERA_STUB := true
#######

# inherit from the proprietary version
-include vendor/renax/BoardConfigVendor.mk

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_QCOM_LIBS := true
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := false
BOARD_HAVE_FM_RADIO := true
BOARD_CAMERA_USE_GETBUFFERINFO := true
BOARD_VENDOR_QCOM_AMSS_VERSION := 3200

BOARD_VENDOR_USE_AKMD := akm8973

# For Koush's recovery
BOARD_HAS_NO_SELECT_BUTTON := false

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION := VER_0_5_X
# BOARD_WLAN_DEVICE := sdio
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/unifi_sdio.ko"
WIFI_DRIVER_FW_STA_PATH := "/system/etc/firmware/unifi-sdio-1/a05/sta.xbv"
# WIFI_DRIVER_MODULE_ARG := ""
WIFI_DRIVER_MODULE_NAME := "unifi_sdio"

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_NO_RADIOIMAGE := true

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_HARDWARE_3D := false
TARGET_BOARD_PLATFORM := qsd8k
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_BOOTLOADER_BOARD_NAME := nb30

BOARD_KERNEL_BASE    := 0x20000000
BOARD_NAND_PAGE_SIZE := 2048
BOARD_PAGE_SIZE := 0x00001000

#TARGET_PREBUILT_KERNEL := device/hoge/zImage

BOARD_KERNEL_CMDLINE := console=ttyDCC0 androidboot.hardware=qcom
BOARD_EGL_CFG := vendor/renax/proprietary/lib/egl/egl.cfg

TARGET_SYSTEMIMAGES_USE_EXT2 := false
TARGET_USERIMAGES_USE_EXT2 := false
