# Live wallpaper packages
PRODUCT_PACKAGES := \
    librs_jni
# LiveWallpapers \
# LiveWallpapersPicker \
# MagicSmokeWallpapers \
# VisualizationWallpapers \

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES := \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Pick up overlay for features that depend on non-open-source files
DEVICE_PACKAGE_OVERLAYS := vendor/renax/overlay

$(call inherit-product, vendor/renax/nb30-vendor-blobs.mk)
