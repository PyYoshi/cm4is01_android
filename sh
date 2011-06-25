#!/bin/sh
mkdir -p bionic/libc/kernel/common/linux
cp -f /home/layna/android/is01_hacked_rom/cm_android/bionic/libc/kernel/common/linux/android_pmem.h bionic/libc/kernel/common/linux/

mkdir -p bionic/linker/
cp -f /home/layna/android/is01_hacked_rom/cm_android/bionic/linker/Android.mk bionic/linker/
cp -f /home/layna/android/is01_hacked_rom/cm_android/bionic/linker/linker.h bionic/linker/

mkdir -p build/tools/apriori/
cp -f /home/layna/android/is01_hacked_rom/cm_android/build/tools/apriori/prelinkmap.c build/tools/apriori/

mkdir -p development/cmds/monkey/src/com/android/commands/monkey/
cp -f /home/layna/android/is01_hacked_rom/cm_android/development/cmds/monkey/src/com/android/commands/monkey/MonkeySourceRandom.java development/cmds/monkey/src/com/android/commands/monkey/

mkdir -p external/apache-http/src/org/apache/http/impl/io/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/apache-http/src/org/apache/http/impl/io/SocketInputBuffer.java external/apache-http/src/org/apache/http/impl/io/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/apache-http/src/org/apache/http/impl/io/SocketOutputBuffer.java external/apache-http/src/org/apache/http/impl/io/

mkdir -p external/apache-http/src/org/apache/http/protocol/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/apache-http/src/org/apache/http/protocol/HTTP.java external/apache-http/src/org/apache/http/protocol/

mkdir -p external/compcache/sub-projects/rzscontrol/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/compcache/sub-projects/rzscontrol/Android.mk external/compcache/sub-projects/rzscontrol/

mkdir -p external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/.config external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/Android.mk external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/common.c external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/config.c external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/config.h external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/ctrl_iface.c external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/driver_wext.c external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/driver_wext.h external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/eap_tls_common.c external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/eloop.c external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/if_index.c external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/os_unix.c external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/tls_openssl.c external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/version.h external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/wireless_copy.h external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/wpa_ctrl.c external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/wpa_ctrl.h external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/wpa_supplicant.c external/wpa_supplicant/
cp -f /home/layna/android/is01_hacked_rom/cm_android/external/wpa_supplicant/wpa_supplicant_i.h external/wpa_supplicant/

mkdir -p frameworks/base/api/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/api/current.xml frameworks/base/api/

mkdir -p frameworks/base/cmds/bootanimation/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/cmds/bootanimation/BootAnimation.cpp frameworks/base/cmds/bootanimation/

mkdir -p frameworks/base/cmds/installd/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/cmds/installd/commands.c frameworks/base/cmds/installd/

mkdir -p frameworks/base/cmds/servicemanager/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/cmds/servicemanager/service_manager.c frameworks/base/cmds/servicemanager/

mkdir -p frameworks/base/core/java/android/provider/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/core/java/android/provider/Settings.java frameworks/base/core/java/android/provider/

mkdir -p frameworks/base/core/java/android/view/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/core/java/android/view/KeyEvent.java frameworks/base/core/java/android/view/

mkdir -p frameworks/base/core/res/assets/images/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/core/res/assets/images/android-logo-mask.png frameworks/base/core/res/assets/images/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/core/res/assets/images/android-logo-shine.png frameworks/base/core/res/assets/images/

mkdir -p frameworks/base/core/res/res/values/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/core/res/res/values/attrs.xml frameworks/base/core/res/res/values/

mkdir -p frameworks/base/data/fonts/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/data/fonts/Android.mk frameworks/base/data/fonts/

mkdir -p frameworks/base/include/binder/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/include/binder/Binder.h frameworks/base/include/binder/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/include/binder/BpBinder.h frameworks/base/include/binder/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/include/binder/IBinder.h frameworks/base/include/binder/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/include/binder/IInterface.h frameworks/base/include/binder/

mkdir -p frameworks/base/include/ui/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/include/ui/EventHub.h frameworks/base/include/ui/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/include/ui/KeycodeLabels.h frameworks/base/include/ui/

mkdir -p frameworks/base/include/utils/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/include/utils/threads.h frameworks/base/include/utils/

mkdir -p frameworks/base/libs/audioflinger/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/audioflinger/A2dpAudioInterface.cpp frameworks/base/libs/audioflinger/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/audioflinger/A2dpAudioInterface.h frameworks/base/libs/audioflinger/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/audioflinger/Android.mk frameworks/base/libs/audioflinger/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/audioflinger/AudioDumpInterface.cpp frameworks/base/libs/audioflinger/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/audioflinger/AudioDumpInterface.h frameworks/base/libs/audioflinger/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/audioflinger/AudioFlinger.cpp frameworks/base/libs/audioflinger/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/audioflinger/AudioFlinger.h frameworks/base/libs/audioflinger/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/audioflinger/AudioHardwareGeneric.cpp frameworks/base/libs/audioflinger/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/audioflinger/AudioHardwareGeneric.h frameworks/base/libs/audioflinger/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/audioflinger/AudioHardwareInterface.cpp frameworks/base/libs/audioflinger/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/audioflinger/AudioHardwareStub.cpp frameworks/base/libs/audioflinger/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/audioflinger/AudioHardwareStub.h frameworks/base/libs/audioflinger/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/audioflinger/AudioHardwareWrapper.cpp frameworks/base/libs/audioflinger/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/audioflinger/AudioHardwareWrapper.h frameworks/base/libs/audioflinger/

mkdir -p frameworks/base/libs/binder/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/binder/Android.mk frameworks/base/libs/binder/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/binder/Binder.cpp frameworks/base/libs/binder/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/binder/BpBinder.cpp frameworks/base/libs/binder/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/binder/IInterface.cpp frameworks/base/libs/binder/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/binder/IPermissionController.cpp frameworks/base/libs/binder/

mkdir -p frameworks/base/libs/ui/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/ui/EventHub.cpp frameworks/base/libs/ui/

mkdir -p frameworks/base/libs/utils/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/utils/Android.mk frameworks/base/libs/utils/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/libs/utils/Threads.cpp frameworks/base/libs/utils/

mkdir -p frameworks/base/media/libmedia/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/media/libmedia/IOMX.cpp frameworks/base/media/libmedia/

mkdir -p frameworks/base/media/libstagefright/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/media/libstagefright/OMXCodec.cpp frameworks/base/media/libstagefright/

mkdir -p frameworks/base/services/jni/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/services/jni/com_android_server_SensorService.cpp frameworks/base/services/jni/

mkdir -p frameworks/base/wifi/java/android/net/wifi/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/base/wifi/java/android/net/wifi/WifiStateTracker.java frameworks/base/wifi/java/android/net/wifi/

mkdir -p frameworks/policies/base/phone/com/android/internal/policy/
cp -f /home/layna/android/is01_hacked_rom/cm_android/frameworks/policies/base/phone/com/android/internal/policy/impl/PhoneWindowManager.java frameworks/policies/base/phone/com/android/internal/policy/

mkdir -p hardware/alsa_sound/
cp -f /home/layna/android/is01_hacked_rom/cm_android/hardware/alsa_sound/AudioHardwareALSA.cpp hardware/alsa_sound/

mkdir -p hardware/libhardware/include/hardware/
cp -f /home/layna/android/is01_hacked_rom/cm_android/hardware/libhardware/include/hardware/sensors.h hardware/libhardware/include/hardware/

mkdir -p hardware/libhardware_legacy/include/hardware_legacy/
cp -f /home/layna/android/is01_hacked_rom/cm_android/hardware/libhardware_legacy/include/hardware_legacy/AudioHardwareBase.h hardware/libhardware_legacy/include/hardware_legacy/
cp -f /home/layna/android/is01_hacked_rom/cm_android/hardware/libhardware_legacy/include/hardware_legacy/AudioHardwareInterface.h hardware/libhardware_legacy/include/hardware_legacy/

mkdir -p hardware/libhardware_legacy/wifi/
cp -f /home/layna/android/is01_hacked_rom/cm_android/hardware/libhardware_legacy/wifi/Android.mk hardware/libhardware_legacy/wifi/
cp -f /home/layna/android/is01_hacked_rom/cm_android/hardware/libhardware_legacy/wifi/wifi.o hardware/libhardware_legacy/wifi/

mkdir -p hardware/msm7k/libaudio-qsd8k/
cp -f /home/layna/android/is01_hacked_rom/cm_android/hardware/msm7k/libaudio-qsd8k/Android.mk hardware/msm7k/libaudio-qsd8k/

mkdir -p hardware/msm7k/libgralloc-qsd8k/
cp -f /home/layna/android/is01_hacked_rom/cm_android/hardware/msm7k/libgralloc-qsd8k/framebuffer.cpp hardware/msm7k/libgralloc-qsd8k/
cp -f /home/layna/android/is01_hacked_rom/cm_android/hardware/msm7k/libgralloc-qsd8k/mapper.cpp hardware/msm7k/libgralloc-qsd8k/

mkdir -p system/core/init/
cp -f /home/layna/android/is01_hacked_rom/cm_android/system/core/init/devices.c system/core/init/
cp -f /home/layna/android/is01_hacked_rom/cm_android/system/core/init/init.h system/core/init/

mkdir -p system/core/mkbootimg/
cp -f /home/layna/android/is01_hacked_rom/cm_android/system/core/mkbootimg/mkbootimg.c system/core/mkbootimg/

mkdir -p system/extras/su/
cp -f /home/layna/android/is01_hacked_rom/cm_android/system/extras/su/su.c system/extras/su/

mkdir -p system/vold/
cp -f /home/layna/android/is01_hacked_rom/cm_android/system/vold/DirectVolume.cpp system/vold/



















