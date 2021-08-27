#
# Copyright (C) 2017 The LineageOS Project
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

PLATFORM_PATH := device/xiaomi/msm8998-common

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a73

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8998
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 4096
TARGET_KERNEL_VERSION := 4.4

BOARD_KERNEL_CMDLINE := androidboot.console=ttyMSM0 androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += swiotlb=2048
BOARD_KERNEL_CMDLINE += loop.max_part=7

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# Assert
TARGET_BOARD_INFO_FILE := $(PLATFORM_PATH)/board-info.txt

# Audio
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
TARGET_USE_QTI_BT_STACK := false

# Display
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true

OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# GPS
USE_DEVICE_SPECIFIC_GPS := true
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true

# HIDL
DEVICE_FRAMEWORK_MANIFEST_FILE := $(PLATFORM_PATH)/framework_manifest.xml
DEVICE_MANIFEST_FILE := $(PLATFORM_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(PLATFORM_PATH)/compatibility_matrix.xml

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5368709120
BOARD_USERDATAIMAGE_PARTITION_SIZE := 120426835968
BOARD_VENDORIMAGE_PARTITION_SIZE := 872415232
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/persist:/persist
TARGET_COPY_OUT_VENDOR := vendor

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/double_tap_enable"
TARGET_USES_INTERACTION_BOOST := true
TARGET_USES_NON_LEGACY_POWERHAL := true

# Properties
TARGET_PRODUCT_PROP += $(PLATFORM_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(PLATFORM_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(PLATFORM_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_UI_BLANK_UNBLANK_ON_INIT := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_xiaomi
TARGET_RELEASETOOLS_EXTENSIONS := $(PLATFORM_PATH)

# RIL
ENABLE_VENDOR_RIL_SERVICE := true
TARGET_USES_OLD_MNC_FORMAT := true

# Security patch level
VENDOR_SECURITY_PATCH := 2019-09-01

# SELinux
# include device/qcom/sepolicy-legacy-um/SEPolicy.mk
# BOARD_VENDOR_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy/vendor
# PRODUCT_PRIVATE_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy/private
# PRODUCT_PUBLIC_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy/public
BOARD_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy-minimal

# Treble
BOARD_VNDK_VERSION := current
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Verity
# Only needed for signing
BOARD_AVB_ENABLE := false

# Wifi
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
HOSTAPD_VERSION := VER_0_8_X
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit from proprietary files
include vendor/xiaomi/msm8998-common/BoardConfigVendor.mk
