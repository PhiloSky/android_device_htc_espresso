## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := Espresso

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-320x480

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/espresso/espresso.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := espresso
PRODUCT_NAME := cm_espresso
PRODUCT_BRAND := tmobile
PRODUCT_MODEL := T-Mobile myTouch 3G Slide
PRODUCT_MANUFACTURER := HTC
#PRODUCT_VERSION_DEVICE_SPECIFIC := -Bluewater-ALPHA1
