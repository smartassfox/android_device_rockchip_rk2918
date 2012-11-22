# Copyright (C) 2011 The Android Open Source Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from rk2918 device
$(call inherit-product, device/rockchip/rk2918/device.mk)

# Camera
#PRODUCT_PACKAGES += \
#	Camera
	
# My packages
PRODUCT_PACKAGES += \
    Launcher2

# Set those variables here to overwrite the inherited values.
PRODUCT_DEVICE := rk2918
PRODUCT_NAME := cm_rk2918
PRODUCT_BRAND := rk2918
PRODUCT_MODEL := rk2918
PRODUCT_MANUFACTURER := Rockchip
