#
# Copyright (C) 2011 The Android Open-Source Project
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

# Should be after the full_base include, which loads languages_full
PRODUCT_AAPT_CONFIG := normal tvdpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_LOCALES := en_US pt_PT es_ES
PRODUCT_CHARACTERISTICS := tablet

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/rockchip/rk2918/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

DEVICE_PACKAGE_OVERLAYS := device/rockchip/rk2918/overlay	
	
	
# These are the hardware-specific configuration files
#PRODUCT_COPY_FILES += \
#	device/rockchip/rk2918/etc/vold.fstab:system/etc/vold.fstab \
#	device/rockchip/rk2918/etc/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf


#Rktools and custom boot/recovery img
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk2918/rktools,rktools) 

#usr
#PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk2918/prebuilt/usr,system)
	
# Wifi
PRODUCT_PROPERTY_OVERRIDES := \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

# Filesystem management tools
PRODUCT_PACKAGES += \
   	utility_make_ext4fs \
	static_busybox \
	setup_fs \
	make_ext4fs \
	libstagefrighthw

	
#HAL port hardware
PRODUCT_PACKAGES += \
	libGLES_android_hw \
	camera.rk29board \
	sensors.rk29board \
	audio.primary.rk29board \
	audio_policy.default \
	tinyplay \
    tinycap \
    tinymix \
	audio.a2dp.default \
    audio.usb.default \
    libtinyalsa \
    libaudioutils
	
	

#Build.prop 
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=160 \
	ro.opengles.version=131072 \
	hwui.render_dirty_regions=false \
    rild.libpath=/system/lib/libril-rk29-dataonly.so \
    ro.kernel.android.checkjni=1 \
    persist.sys.ui.hw=true \
    opengl.vivante.texture=1 \
	ro.rk.sdcard_volume=InteralStorage \
	ro.rk.external_volume=SDCard \
	ro.rk.usb_host_volume=USBDisk \
	ro.sf.fakerotation=true \
    sys.hwc.compose_policy=6 \
	ro.vold.switchablepair=/mnt/sdcard,/mnt/external_sd \
	accelerometer.invert_x=1 \
	qemu.sf.lcd_density=120 \
	qemu.hw.mainkeys=0
	
PRODUCT_TAGS += dalvik.gc.type-precise
	
# Set default USB interface
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
#	persist.sys.usb.config=mass_storage	

# other kernel modules not in ramdisk
PRODUCT_COPY_FILES += $(foreach module,\
	$(filter-out $(RAMDISK_MODULES),$(wildcard device/rockchip/rk2918/modules/*.ko)),\
	$(module):system/lib/modules/$(notdir $(module)))

# copy the builder 
PRODUCT_COPY_FILES += \
	device/rockchip/rk2918/custom_boot.sh:custom_boot.sh

#Fix for dalvik-cache
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dexopt-data-only=1
