#
# Copyright (C) 2012 The Android Open Source Project
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


DEVICE_PACKAGE_OVERLAYS := device/htc/espresso/overlay

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/espresso/prebuilt/usr/keylayout/latte-keypad-v2.kl:system/usr/keylayout/latte-keypad-v2.kl \
    device/htc/espresso/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/espresso/prebuilt/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

# Keychars
PRODUCT_COPY_FILES += \
    device/htc/espresso/prebuilt/usr/keychars/latte-keypad-v2.kcm:system/usr/keychars/latte-keypad-v2.kcm

# Input device calibration files
PRODUCT_COPY_FILES += \
    device/htc/espresso/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/espresso/prebuilt/usr/idc/curcial-oj.idc:system/usr/idc/curcial-oj.idc

PRODUCT_COPY_FILES += \
    device/htc/espresso/init.latte.rc:root/init.latte.rc \
    device/htc/espresso/init.latte.usb.rc:root/init.latte.usb.rc \
    device/htc/espresso/ueventd.latte.rc:root/ueventd.latte.rc

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/librilswitch.so \
    rilswitch.vendorlibpath=/system/lib/libhtc_ril.so \
    rilswitch.ganlibpath=/system/lib/libganril.so \
    ro.ril.enable.dtm=0 \
    ro.ril.hsdpa.category=8 \
    ro.ril.hsupa.category=5 \
    ro.ril.disable.fd.plmn.prefix=23402,23410,23411 \
    ro.ril.def.agps.mode=2 \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=10 \
    mobiledata.interfaces=gannet0,rmnet0,rmnet1,rmnet2 \
    wifi.interface=tiwlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.sf.lcd_density=160 \
    ro.opengles.version=131072 \
    ro.telephony.ril.v3=signalstrength,skipbrokendatacall

# Default network type.
# 0 => WCDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# For emmc phone storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.phone_storage = 0


# This is a 512MB device, so 32mb heapsize
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/espresso/espresso-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    settings.display.autobacklight=1 \
    settings.display.brightness=143 \
    persist.service.mount.playsnd=0 \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.aud.wma.enabled=1 \
    ro.media.dec.vid.wmv.enabled=1 \
    dalvik.vm.dexopt-flags=m=y \
    ro.config.sync=yes \
    persist.sys.usb.config=mass_storage,adb \
    dalvik.vm.dexopt-data-only=1 \
    debug.sf.hw=1 \
    debug.qctwa.statusbar=1 \
    debug.qctwa.preservebuf=1 \
    com.qc.hardware=true \
    com.qc.hdmi_out=false \
    debug.camcorder.disablemeta=1

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Improve graphic performance
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.use_16bpp_alpha=1 \
    persist.sys.use_dithering=0

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/espresso/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    librs_jni \
    lights.latte \
    gralloc.msm7x27 \
    copybit.msm7x27 \
    sensors.latte \
    audio.primary.latte \
    audio_policy.latte \
    audio.a2dp.default \
    gps.latte \
    libmm-omxcore \
    libOmxCore \
    libstagefrighthw \
    hwcomposer.default \
    hwcomposer.msm7x27 \
    com.android.future.usb.accessory \
    e2fsck \
    camera.msm7x27
    
# WiFi stuff
PRODUCT_PACKAGES += \
    wpa_supplicant.conf \
    tiwlan.ini \
    dhcpcd.conf \
    wlan_cu \
    wlan_loader \
    libCustomWifi

# HotSpot
# PRODUCT_PACKAGES += \
#   tiap_loader \
#   tiap_cu \
#   tiwlan_ap.ini \
#   hostap \
#   hostapd.conf

# Torch
PRODUCT_PACKAGES += \
    Torch

# Wifi Calling Part1
PRODUCT_PACKAGES += \
    GanOptimizer

# Wifi Calling Part2
PRODUCT_COPY_FILES += \
    device/htc/espresso/prebuilt/app/HTC-PYRTM-ICS-4.0.1-2.3-49986-4.3.apk:system/app/HTC-PYRTM-ICS-4.0.1-2.3-49986-4.3.apk \
    device/htc/espresso/prebuilt/lib/libkineto.so:system/lib/libkineto.so

# File Manager
PRODUCT_PACKAGES += \
    FileManager

PRODUCT_COPY_FILES += \
    device/htc/espresso/vold.fstab:system/etc/vold.fstab \
    device/common/gps/gps.conf_US:system/etc/gps.conf \
    vendor/cm/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/htc/espresso/prebuilt/etc/init.d/05mountsd:system/etc/init.d/05mountsd \
    device/htc/espresso/prebuilt/etc/init.d/95wificalling:system/etc/init.d/95wificalling \
    device/htc/espresso/prebuilt/lib/libcamera.so:system/lib/libcamera.so \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf
    
# Backwards compatible libcrypto
PRODUCT_COPY_FILES += \
    device/htc/espresso/prebuilt/lib/libcryp98.so:system/lib/libcryp98.so
    
# Kernel Target
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/espresso/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Prebuilt Modules
PRODUCT_COPY_FILES += \
    device/htc/espresso/prebuilt/etc/firmware/wl1271.bin:system/etc/firmware/wl1271.bin \
    device/htc/espresso/prebuilt/lib/modules/sdio.ko:/system/lib/modules/sdio.ko \
    device/htc/espresso/prebuilt/lib/modules/tiwlan_drv.ko:/system/lib/modules/tiwlan_drv.ko \
    device/htc/espresso/prebuilt/lib/modules/tiap_drv.ko:/system/lib/modules/tiap_drv.ko \
    device/htc/espresso/prebuilt/lib/modules/gan-eth.ko:/system/lib/modules/gan-eth.ko

# ICS GPU drivers from Qualcomm
PRODUCT_COPY_FILES += \
    device/htc/espresso/prebuilt/lib/libC2D2.so:system/lib/libC2D2.so \
    device/htc/espresso/prebuilt/lib/libgsl.so:system/lib/libgsl.so \
    device/htc/espresso/prebuilt/lib/libOpenVG.so:system/lib/libOpenVG.so \
    device/htc/espresso/prebuilt/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
    device/htc/espresso/prebuilt/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    device/htc/espresso/prebuilt/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/htc/espresso/prebuilt/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    device/htc/espresso/prebuilt/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/htc/espresso/prebuilt/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/htc/espresso/prebuilt/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    device/htc/espresso/prebuilt/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/htc/espresso/prebuilt/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw

# media profiles and capabilities spec
$(call inherit-product, device/htc/espresso/media_a1026.mk)

# Sets copy files for all HTC-specific device
PRODUCT_COPY_FILES += device/htc/espresso/prebuilt/etc/ecclist_for_mcc.conf:system/etc/ecclist_for_mcc.conf

$(call inherit-product, build/target/product/full_base_telephony.mk)

PRODUCT_NAME := generic_espresso
PRODUCT_MANUFACTURER := HTC
PRODUCT_DEVICE := espresso
