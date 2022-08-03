#
# Copyright (C) 2021 Android Open Source Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from yogurt device makefile
$(call inherit-product, device/micromax/yogurt/device.mk)

# Inherit some common stuff.
TARGET_BOOT_ANIMATION_RES := 1080

# Inherit From Lineage Vendor
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_yogurt
PRODUCT_DEVICE := yogurt
PRODUCT_BRAND := Micromax
PRODUCT_MODEL := Micromax IN Note 1
PRODUCT_MANUFACTURER := micromax

# Build info
BUILD_FINGERPRINT := "Micromax/E7746/E7746:10/QP1A.190711.020/1604634551:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=yogurt \
    PRODUCT_NAME=yogurt \
    PRIVATE_BUILD_DESC="full_k69v1_64-user 10 QP1A.190711.020 1604634551 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-micromax
