# Copyright (C) 2015 Krossware Interactive <http://www.krossware.com>
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

TARGET_BOARD_PLATFORM := mt6582

-include vendor/mediatek/$(TARGET_BOARD_PLATFORM)-common/BoardConfigVendor.mk

LOCAL_PATH := device/mediatek/$(TARGET_BOARD_PLATFORM)-common

# Board
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a7
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_VFP := true

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_BOARD_PLATFORM)

# Flags
TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true

# EGL settings
BOARD_EGL_CFG := $(LOCAL_PATH)/rootdir/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# libstagefright
BOARD_HAS_MTK_OMX_HARDWARE := true

# Bootimage
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/bootimg.mk
BOARD_MKBOOTIMG_ARGS := --board 1336460062

# Kernel
TARGET_KMODULES := true
BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
TARGET_OTA_ASSERT_DEVICE := $(TARGET_BOARD_PLATFORM)

# RECOVERY_VARIANT := philz
# BOARD_USE_MTK_LAYOUT := true
# BOARD_USE_NTFS_3G := false
# BOARD_HAS_NO_FB2PNG := true
# NO_AROMA_FILE_MANAGER := true

# Power
TARGET_POWERHAL_VARIANT := cm

# RIL
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/ril/

# WebGL
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4:=true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# SELINUX
BOARD_SEPOLICY_DIRS := \
	$(LOCAL_PATH)/sepolicy

BOARD_SEPOLICY_UNION := \
	device.te \
	app.te \
	system.te \
	file_contexts

# WIFI
BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_CONNECTIVITY_MODULE := conn_soc
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P