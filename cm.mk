## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := rk2918

# Inherit some common CM stuff. 
# Changed to not get the proprietary stuff
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/rockchip/rk2918/full_rk2918.mk)

## Device identifier. This must come after all inclusions
# Set those variables here to overwrite the inherited values.
PRODUCT_DEVICE := rk2918
PRODUCT_NAME := cm_rk2918
PRODUCT_BRAND := rk2918
PRODUCT_MODEL := rk2918
PRODUCT_MANUFACTURER := Rockchip
