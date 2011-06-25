
# Check generic.mk/languages_full.mk to see what applications/languages are installed turns out all languages get included if I don't specify, but some seem to be missing the actuall translation.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)
$(call inherit-product-if-exists, vendor/renax/nb30-vendor.mk)
$(call inherit-product-if-exists, vendor/renax/prebuild/Android.mk)

# Define Prelink
PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/renax/prelink-linux-arm.map

# Enabling Ring Tones
include frameworks/base/data/sounds/OriginalAudio.mk

# nb30 uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# Publish that we support the live wallpaper feature and more hardware.
PRODUCT_COPY_FILES += \
frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml

# Overrides
PRODUCT_BRAND := SHARP
PRODUCT_NAME := IS01
PRODUCT_DEVICE := IS01
PRODUCT_MODEL := IS01
PRODUCT_MANUFACTURER := SHARP

# Additional build prop settings
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    ro.sf.lcd_density=240 \
    ro.product.locale.language=ja \
    ro.product.locale.region=JP

# ROM Version
PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=CM6byDevRenax-$(shell date +%m%d%Y)-IS01

#hardware revision
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hw_version=2

# Default network type.
# 0 => WCDMA preferred, 3 => GSM/AUTO (PRL) preferred
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.telephony.default_network=3

# WiFi configuration
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# The OpenGL ES API level that is natively supported by this device.
# Enable cache on Google Maps
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# This is a high density device with more memory, so larger vm heaps for it.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m

PRODUCT_NAME := generic_nb30
PRODUCT_DEVICE := nb30
