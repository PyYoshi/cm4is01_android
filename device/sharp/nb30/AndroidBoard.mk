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

LOCAL_PATH := $(call my-dir)

#----------------------------------------------------------------------
# Compile (L)ittle (K)ernel bootloader and the nandwrite utility
#----------------------------------------------------------------------
ifneq ($(strip $(TARGET_NO_BOOTLOADER)),true)

# Compile
#include bootable/bootloader/lk/AndroidBoot.mk

INSTALLED_BOOTLOADER_TARGET := $(PRODUCT_OUT)/bootloader
file := $(INSTALLED_BOOTLOADER_TARGET)
ALL_PREBUILT += $(file)
$(file): $(TARGET_BOOTLOADER) | $(ACP)
	$(transform-prebuilt-to-target)

# Copy nandwrite utility to target out directory
INSTALLED_NANDWRITE_TARGET := $(PRODUCT_OUT)/nandwrite
file := $(INSTALLED_NANDWRITE_TARGET)
ALL_PREBUILT += $(file)
$(file) : $(TARGET_NANDWRITE) | $(ACP)
	$(transform-prebuilt-to-target)
endif

#----------------------------------------------------------------------
# Compile Linux Kernel
#----------------------------------------------------------------------
ifeq ($(KERNEL_DEFCONFIG),)
    KERNEL_DEFCONFIG := .config
endif

#include kernel/AndroidKernel.mk

file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file) : $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/SH_headset_key.kl
ALL_PREBUILT += $(file)
$(file) : vendor/renax/proprietary/usr/keylayout/SH_headset_key.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/SH_pm_key.kl
ALL_PREBUILT += $(file)
$(file) : vendor/renax/proprietary/usr/keylayout/SH_pm_key.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/SH_qwerty_key.kl
ALL_PREBUILT += $(file)
$(file) : vendor/renax/proprietary/usr/keylayout/SH_qwerty_key.kl | $(ACP)
	$(transform-prebuilt-to-target)

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
endif

file := $(TARGET_ROOT_OUT)/init.qcom.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/root/init.qcom.rc | $(ACP)
$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/default.prop
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/root/default.prop | $(ACP)
$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init.goldfish.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/root/init.goldfish.rc | $(ACP)
$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/root/init.rc | $(ACP)
$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init.qcom.sh
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/root/init.qcom.sh| $(ACP)
$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/initlogo.rle
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/root/initlogo.rle | $(ACP)
$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/root/init.qcom.post_boot.sh
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/root/init.qcom.post_boot.sh| $(ACP)
$(transform-prebuilt-to-target)
