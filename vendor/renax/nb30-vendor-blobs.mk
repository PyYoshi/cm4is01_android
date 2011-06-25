# All the blobs necessary for nb30
# Kernel modules
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/lib/modules/2.6.29-DevRenax/memo:obj/lib/modules/2.6.29-DevRenax/memo \
vendor/renax/proprietary/lib/modules/unifi_sdio.ko:obj/lib/modules/unifi_sdio.ko

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/lib/libcamera.so:obj/lib/libcamera.so \
vendor/renax/proprietary/lib/libloc_api.so:obj/lib/libloc_api.so \
vendor/renax/proprietary/lib/libloc_api-rpc.so:obj/lib/libloc_api-rpc.so \
vendor/renax/proprietary/lib/libcommondefs.so:obj/lib/libcommondefs.so \
vendor/renax/proprietary/lib/libsynergy_com.so:obj/lib/libsynergy_com.so

# Prebuilt sound libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/lib/libaudio.so:obj/lib/libaudio.so \
vendor/renax/proprietary/lib/libaudioyamaha.so:obj/lib/libaudioyamaha.so \
vendor/renax/proprietary/lib/libmediayamaha.so:obj/lib/libmediayamaha.so \
vendor/renax/proprietary/lib/libmediayamahacheck.so:obj/lib/libmediayamahacheck.so \
vendor/renax/proprietary/lib/libmediayamahaservice.so:obj/lib/libmediayamahaservice.so \
vendor/renax/proprietary/lib/libmediayamahasmw.so:obj/lib/libmediayamahasmw.so \
vendor/renax/proprietary/lib/libmediayamahautils.so:obj/lib/libmediayamahautils.so \
vendor/renax/proprietary/lib/libshspamp.so:obj/lib/libshspamp.so \
vendor/renax/proprietary/lib/libshvibrator.so:obj/lib/libshvibrator.so \
vendor/renax/proprietary/lib/libsynergy_liba2dp.so:obj/lib/libsynergy_liba2dp.so

# Copy libril
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
vendor/renax/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \
vendor/renax/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
vendor/renax/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
vendor/renax/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
vendor/renax/proprietary/lib/libwms.so:system/lib/libwms.so \
vendor/renax/proprietary/lib/libwmsts.so:system/lib/libwmsts.so \
vendor/renax/proprietary/lib/libcm.so:system/lib/libcm.so \
vendor/renax/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
vendor/renax/proprietary/lib/libdss.so:system/lib/libdss.so \
vendor/renax/proprietary/lib/libqmi.so:system/lib/libqmi.so \
vendor/renax/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \
vendor/renax/proprietary/lib/libauth.so:system/lib/libauth.so \
vendor/renax/proprietary/lib/libioemextmoni.so:system/lib/libioemextmoni.so \
vendor/renax/proprietary/lib/libuim.so:system/lib/libuim.so \
vendor/renax/proprietary/lib/libdll.so:system/lib/libdll.so \

# Copy EGL libraries
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/lib/egl/egl.cfg:system/lib/egl/egl.cfg

# Copy hw
PRODUCT_COPY_FILES +=  \
vendor/renax/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so \
vendor/renax/proprietary/lib/hw/copybit.qsd8k.so:system/lib/hw/copybit.qsd8k.so \
vendor/renax/proprietary/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
vendor/renax/proprietary/lib/hw/gralloc.qsd8k.so:system/lib/hw/gralloc.qsd8k.so \
vendor/renax/proprietary/lib/hw/lights.qsd8k.so:system/lib/hw/lights.qsd8k.so \


#Copy camera libraries
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/lib/libcamera.so:system/lib/libcamera.so \
vendor/renax/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \
vendor/renax/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so

#Copy Sound module
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/bin/mediayamahaserver:system/bin/mediayamahaserver \
vendor/renax/proprietary/lib/libaudioyamaha.so:system/lib/libaudioyamaha.so \
vendor/renax/proprietary/lib/libmediayamahaservice.so:system/lib/libmediayamahaservice.so \
vendor/renax/proprietary/lib/libmediayamaha.so:system/lib/libmediayamaha.so \
vendor/renax/proprietary/lib/libmediayamahacheck.so:system/lib/libmediayamahacheck.so \
vendor/renax/proprietary/lib/libmediayamahautils.so:system/lib/libmediayamahautils.so \
vendor/renax/proprietary/lib/libmediayamahasmw.so:system/lib/libmediayamahasmw.so \
vendor/renax/proprietary/lib/libshspamp.so:system/lib/libshspamp.so \
vendor/renax/proprietary/lib/libshvibrator.so:system/lib/libshvibrator.so \
vendor/renax/proprietary/lib/libsynergy_liba2dp.so:system/lib/libsynergy_liba2dp.so \
vendor/renax/proprietary/lib/libaudio.so:system/lib/libaudio.so \
vendor/renax/proprietary/etc/AudioFilter.csv:system/etc/AudioFilter.csv

# Copy dhcpd 
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
vendor/renax/proprietary/etc/dhcpcd/dhcpcd-run-hooks:system/etc/dhcpcd/dhcpcd-run-hooks \
vendor/renax/proprietary/etc/dhcpcd/dhcpcd-hooks/01-test:system/etc/dhcpcd/dhcpcd-hooks/01-test \
vendor/renax/proprietary/etc/dhcpcd/dhcpcd-hooks/20-dns.conf:system/etc/dhcpcd/dhcpcd-hooks/20-dns.conf \
vendor/renax/proprietary/etc/dhcpcd/dhcpcd-hooks/95-configured:system/etc/dhcpcd/dhcpcd-hooks/95-configured

# Copy bluez
#PRODUCT_COPY_FILES += \
#vendor/renax/proprietary/etc/bluez/audio.conf:system/etc/bluez/audio.conf \
#vendor/renax/proprietary/etc/bluez/hcid.conf:system/etc/bluez/hcid.conf \
#vendor/renax/proprietary/etc/bluez/input.conf:system/etc/bluez/input.conf

# Copy dbus_bt
#PRODUCT_COPY_FILES += \
#vendor/renax/proprietary/etc/dbus_bt/client.xml:system/etc/dbus_bt/client.xml \
#vendor/renax/proprietary/etc/dbus_bt/clientsession.xml:system/etc/dbus_bt/clientsession.xml \
#vendor/renax/proprietary/etc/dbus_bt/clienttransfer.xml:system/etc/dbus_bt/clienttransfer.xml \
#vendor/renax/proprietary/etc/dbus_bt/config.xml:system/etc/dbus_bt/config.xml \
#vendor/renax/proprietary/etc/dbus_bt/dbus_bt.sh:system/etc/dbus_bt/dbus_bt.sh \
#vendor/renax/proprietary/etc/dbus_bt/server.xml:system/etc/dbus_bt/server.xml \
#vendor/renax/proprietary/etc/dbus_bt/serversession.xml:system/etc/dbus_bt/serversession.xml \
#vendor/renax/proprietary/etc/dbus_bt/servertransfer.xml:system/etc/dbus_bt/servertransfer.xml

# Copy GPS libraries and dependencies
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/lib/libcommondefs.so:system/lib/libcommondefs.so \
vendor/renax/proprietary/etc/gps.conf:system/etc/gps.conf \
vendor/renax/proprietary/lib/libloc_api.so:system/lib/libloc_api.so \
vendor/renax/proprietary/lib/libloc_api-rpc.so:system/lib/libloc_api-rpc.so \
vendor/renax/proprietary/bin/loc_api_app:system/bin/loc_api_app \

# Copy WiFi/Bluetooth firmware and config
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/lib/modules/unifi_sdio.ko:system/lib/modules/unifi_sdio.ko \
vendor/renax/proprietary/etc/firmware/unifi-sdio-1/a03/sta.xbv:system/etc/firmware/unifi-sdio-1/a03/sta.xbv \
vendor/renax/proprietary/etc/firmware/unifi-sdio-1/a04/sta.xbv:system/etc/firmware/unifi-sdio-1/a04/sta.xbv \
vendor/renax/proprietary/etc/firmware/unifi-sdio-1/a05/sta.xbv:system/etc/firmware/unifi-sdio-1/a05/sta.xbv \
vendor/renax/proprietary/etc/firmware/unifi-sdio-1/mac.txt:system/etc/firmware/unifi-sdio-1/mac.txt \
vendor/renax/proprietary/etc/firmware/unifi-sdio-1/ptest.xbv:system/etc/firmware/unifi-sdio-1/ptest.xbv \
vendor/renax/proprietary/etc/firmware/unifi-sdio-1/ufmib.dat:system/etc/firmware/unifi-sdio-1/ufmib.dat \
vendor/renax/proprietary/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
vendor/renax/proprietary/etc/wifi/nvram.txt:system/etc/wifi/nvram.txt \
vendor/renax/proprietary/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Copy keylayout and headset driver
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/usr/keylayout/SH_headset_key.kl:system/usr/keylayout/SH_headset_key.kl \
vendor/renax/proprietary/usr/keylayout/SH_pm_key.kl:system/usr/keylayout/SH_pm_key.kl \
vendor/renax/proprietary/usr/keylayout/SH_qwerty_key.kl:system/usr/keylayout/SH_qwerty_key.kl \
vendor/renax/proprietary/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
vendor/renax/proprietary/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
vendor/renax/proprietary/usr/keychars/SH_qwerty_key.kcm.bin:system/usr/keychars/SH_qwerty_key.kcm.bin \
vendor/renax/proprietary/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
vendor/renax/proprietary/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin

# Copy Vold and configs
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/etc/vold.fstab:system/etc/vold.fstab \
vendor/renax/proprietary/etc/vold.conf:system/etc/vold.conf

# Copy sensor library, binary and configuration
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
vendor/renax/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \

# Copy shdisp_process, shlcdc_process and their related libraries
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/bin/shdisp_process:system/bin/shdisp_process \
vendor/renax/proprietary/bin/shlcdc_process:system/bin/shlcdc_process \
vendor/renax/proprietary/lib/libshdisp.so:system/lib/libshdisp.so \
vendor/renax/proprietary/lib/libshtps.so:system/lib/libshtps.so \
vendor/renax/proprietary/lib/libshkbd.so:system/lib/libshkbd.so \
vendor/renax/proprietary/lib/libshlcdc.so:system/lib/libshlcdc.so \
vendor/renax/proprietary/lib/libbattlog.so:system/lib/libbattlog.so \

# Copy sdcervice and their related libraries
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/bin/sdservice:system/bin/sdservice \
vendor/renax/proprietary/lib/libsdservice.so:system/lib/libsdservice.so \
vendor/renax/proprietary/lib/libsdcommon.so:system/lib/libsdcommon.so \
vendor/renax/proprietary/lib/libsafetybox.so:system/lib/libsafetybox.so \
vendor/renax/proprietary/lib/libapiprotection.so:system/lib/libapiprotection.so \
vendor/renax/proprietary/lib/libprovenprocess.so:system/lib/libprovenprocess.so \
vendor/renax/proprietary/lib/libshsd.so:system/lib/libshsd.so \
vendor/renax/proprietary/lib/libsdplayer.so:system/lib/libsdplayer.so \
vendor/renax/proprietary/lib/libsdservice.so:system/lib/libsdservice.so \
vendor/renax/proprietary/lib/libsdrecorddata.so:system/lib/libsdrecorddata.so \
vendor/renax/proprietary/lib/libsdrecplay.so:system/lib/libsdrecplay.so \
vendor/renax/proprietary/lib/libsdservice_jni.so:system/lib/libsdservice_jni.so \

# Copy dtvserver and their related libraries
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/bin/dtvserver:system/bin/dtvserver \
vendor/renax/proprietary/lib/libDtvService.so:system/lib/libDtvService.so \
vendor/renax/proprietary/lib/libDtvBmlService.so:system/lib/libDtvBmlService.so \
vendor/renax/proprietary/lib/libDtv.so:system/lib/libDtv.so \
vendor/renax/proprietary/lib/libsgl.so:system/lib/libsgl.so \
vendor/renax/proprietary/lib/libmotionemoji.so:system/lib/libmotionemoji.so \
vendor/renax/proprietary/lib/libDtv_jni.so:system/lib/libDtv_jni.so \
vendor/renax/proprietary/lib/libDtvBml.so:system/lib/libDtvBml.so \
vendor/renax/proprietary/lib/libDtvBml_jni.so:system/lib/libDtvBml_jni.so \

# Copy synergy_service and their related libraries
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/bin/synergy_service:system/bin/synergy_service \
vendor/renax/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \
vendor/renax/proprietary/lib/libdsm.so:system/lib/libdsm.so \
vendor/renax/proprietary/lib/libqueue.so:system/lib/libqueue.so \
vendor/renax/proprietary/lib/libnv.so:system/lib/libnv.so \
vendor/renax/proprietary/lib/libdiag.so:system/lib/libdiag.so \
vendor/renax/proprietary/lib/libsynergy_com.so:system/lib/libsynergy_com.so \
vendor/renax/proprietary/bin/synergy_wifi_attach:system/bin/synergy_wifi_attach \
vendor/renax/proprietary/bin/unififw:system/bin/unififw \

# Copy akmd2 
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/bin/akmd2:system/bin/akmd2 \

# Copy shusb_process
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/bin/shusb_process:system/bin/shusb_process \

# Copy medousa and their related libraries
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/bin/medousa:system/bin/medousa \

# Copy shsd_process and their related libraries
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/bin/shsd_process:system/bin/shsd_process \
vendor/renax/proprietary/lib/libshtimer.so:system/lib/libshtimer.so \


# Copy obexd and their related libraries
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/bin/obexd:system/bin/obexd \
vendor/renax/proprietary/lib/libirda.so:system/lib/libirda.so \
vendor/renax/proprietary/lib/lib_irda_drv.so:system/lib/lib_irda_drv.so \

# Copy akmd2(Accelarator)
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/bin/akmd2:system/bin/akmd2

# Copy qmuxd
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/bin/qmuxd:system/bin/qmuxd \

# Copy port-bridge and their related libraries
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/bin/port-bridge:system/bin/port-bridge \

# Copy logd and their related libraries
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/bin/logd:system/bin/logd \
vendor/renax/proprietary/lib/libshterm.so:system/lib/libshterm.so \
vendor/renax/proprietary/lib/libmjupd.so:system/lib/libmjupd.so \
vendor/renax/proprietary/lib/libYamahaKill.so:system/lib/libYamahaKill.so \

# Copy dgstmgrd
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/bin/dgstmgrd:system/bin/dgstmgrd \

# Copy usbmgrd
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/bin/usbmgrd:system/bin/usbmgrd \

# Copy fuse and their related libraries
#PRODUCT_COPY_FILES += \
#vendor/renax/proprietary/bin/fatsh:system/bin/fatsh \
#vendor/renax/proprietary/lib/libfuse.so:system/lib/libfuse.so \
#vendor/renax/proprietary/lib/libfatfs.so:system/lib/libfatfs.so \
#vendor/renax/proprietary/bin/fatsh_cprm:system/bin/fatsh_cprm \
#vendor/renax/proprietary/bin/fusermount:system/bin/fusermount \
#vendor/renax/proprietary/bin/mountfuse:system/bin/mountfuse \

# Copy dumpe2fs and their related libraries
#PRODUCT_COPY_FILES += \
#vendor/renax/proprietary/bin/dumpe2fs:system/bin/dumpe2fs \
#vendor/renax/proprietary/bin/e2fsck:system/bin/e2fsck \
#vendor/renax/proprietary/bin/tune2fs:system/bin/tune2fs \
#vendor/renax/proprietary/lib/libext2fs.so:system/lib/libext2fs.so \
#vendor/renax/proprietary/lib/libext2_com_err.so:system/lib/libext2_com_err.so \
#vendor/renax/proprietary/lib/libext2_uuid.so:system/lib/libext2_uuid.so \
#vendor/renax/proprietary/lib/libext2_e2p.so:system/lib/libext2_e2p.so \
#vendor/renax/proprietary/lib/libext2_blkid.so:system/lib/libext2_blkid.so \
#vendor/renax/proprietary/lib/libext2_profile.so:system/lib/libext2_profile.so \

# Copy hoge and their related libraries
#PRODUCT_COPY_FILES += \
#vendor/renax/proprietary/bin/:system/bin/ \
#vendor/renax/proprietary/lib/:system/lib/ \
#vendor/renax/proprietary/lib/:system/lib/ \
#vendor/renax/proprietary/lib/:system/lib/ \
#vendor/renax/proprietary/lib/:system/lib/ \
#vendor/renax/proprietary/lib/:system/lib/ \
#vendor/renax/proprietary/lib/:system/lib/ \
#vendor/renax/proprietary/lib/:system/lib/ \
#vendor/renax/proprietary/lib/:system/lib/ \
#vendor/renax/proprietary/lib/:system/lib/ \

# Copy proprietary Omx* V/A encoders and decoders
PRODUCT_COPY_FILES += \
vendor/renax/proprietary/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
vendor/renax/proprietary/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
vendor/renax/proprietary/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
vendor/renax/proprietary/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
vendor/renax/proprietary/lib/libOmxQcelp13Dec.so:system/lib/libOmxQcelp13Dec.so \
vendor/renax/proprietary/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
vendor/renax/proprietary/lib/libOmxVdec.so:system/lib/libOmxVdec.so \
vendor/renax/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so

#Copy gapps
PRODUCT_COPY_FILES += \
vendor/renax/gapps/GooglePartnerSetup.apk:system/app/GooglePartnerSetup.apk \
vendor/renax/gapps/GoogleServicesFramework.apk:system/app/GoogleServicesFramework.apk \
vendor/renax/gapps/GoogleQuickSearchBox.apk:system/app/GoogleQuickSearchBox.apk \
vendor/renax/gapps/features.xml:system/etc/permissions/features.xml \
vendor/renax/gapps/Gmail.apk:system/app/Gmail.apk \
vendor/renax/gapps/GenieWidget.apk:system/app/GenieWidget.apk \
vendor/renax/gapps/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
vendor/renax/gapps/libspeech.so:system/lib/libspeech.so \
vendor/renax/gapps/GoogleBackupTransport.apk:system/app/GoogleBackupTransport.apk \
vendor/renax/gapps/kickback.apk:system/app/kickback.apk \
vendor/renax/gapps/Street.apk:system/app/Street.apk \
vendor/renax/gapps/GoogleFeedback.apk:system/app/GoogleFeedback.apk \
vendor/renax/gapps/OneTimeInitializer.apk:system/app/OneTimeInitializer.apk \
vendor/renax/gapps/talkback.apk:system/app/talkback.apk \
vendor/renax/gapps/SetupWizard.apk:system/app/SetupWizard.apk \
vendor/renax/gapps/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
vendor/renax/gapps/Vending.apk:system/app/Vending.apk \
vendor/renax/gapps/Talk.apk:system/app/Talk.apk \
vendor/renax/gapps/MediaUploader.apk:system/app/MediaUploader.apk \
vendor/renax/gapps/libvoicesearch.so:system/lib/libvoicesearch.so \
vendor/renax/gapps/NetworkLocation.apk:system/app/NetworkLocation.apk \
vendor/renax/gapps/YouTube.apk:system/app/YouTube.apk \
vendor/renax/gapps/MarketUpdater.apk:system/app/MarketUpdater.apk \
vendor/renax/gapps/soundback.apk:system/app/soundback.apk \
vendor/renax/gapps/googlevoice.apk:system/app/googlevoice.apk \
vendor/renax/gapps/CarHomeGoogle.apk:system/app/CarHomeGoogle.apk \
vendor/renax/gapps/CarHomeLauncher.apk:system/app/CarHomeLauncher.apk \
vendor/renax/gapps/Maps.apk:system/app/Maps.apk \
vendor/renax/gapps/GoogleCalendarSyncAdapter.apk:system/app/GoogleCalendarSyncAdapter.apk \
vendor/renax/gapps/VoiceSearch.apk:system/app/VoiceSearch.apk \
vendor/renax/gapps/GoogleContactsSyncAdapter.apk:system/app/GoogleContactsSyncAdapter.apk \
vendor/renax/gapps/Facebook.apk:system/app/Facebook.apk \
vendor/renax/gapps/Twitter.apk:system/app/Twitter.apk

# Common CM overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/common

# Copy CM prebuild
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/cyanogen/prebuilt/common/bin/verify_cache_partition_size.sh:system/bin/verify_cache_partition_size.sh \
    vendor/cyanogen/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/cyanogen/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/cyanogen/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/cyanogen/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    vendor/cyanogen/prebuilt/common/etc/profile:system/etc/profile \
    vendor/cyanogen/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/cyanogen/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/cyanogen/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/cyanogen/prebuilt/common/etc/init.d/04modules:system/etc/init.d/04modules \
    vendor/cyanogen/prebuilt/common/etc/init.d/20userinit:system/etc/init.d/20userinit \
    vendor/cyanogen/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache \
    vendor/cyanogen/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/cyanogen/prebuilt/common/bin/fix_permissions:system/bin/fix_permissions \
    vendor/cyanogen/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/cyanogen/prebuilt/common/xbin/htop:system/xbin/htop \
    vendor/cyanogen/prebuilt/common/xbin/irssi:system/xbin/irssi \
    vendor/cyanogen/prebuilt/common/xbin/lsof:system/xbin/lsof \
    vendor/cyanogen/prebuilt/common/xbin/powertop:system/xbin/powertop \
    vendor/cyanogen/prebuilt/common/xbin/openvpn-up.sh:system/xbin/openvpn-up.sh

# CyanogenMod specific product packages
PRODUCT_PACKAGES += \
    CMParts \
    CMPartsHelper \
    CMStats \
    CMUpdateNotify \
    CMWallpapers \
    FileManager \
    Superuser \
    AndroidTerm \
    ADWLauncher \

# Copy bootanimation
PRODUCT_COPY_FILES +=  \
    vendor/renax/proprietary/media/bootanimation.zip:system/media/bootanimation.zip

# Copy init.local.rc and related *.sh
PRODUCT_COPY_FILES +=  \
    vendor/renax/proprietary/etc/init.local.rc:system/etc/init.local.rc \
    vendor/renax/proprietary/bin/fix_permissions_mod:system/bin/fix_permissions_mod \






