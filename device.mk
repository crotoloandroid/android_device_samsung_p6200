#
# Copyright (C) 2012 The CyanogenMod Project
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

$(call inherit-product, device/samsung/smdk4210-tab/device.mk)
$(call inherit-product-if-exists, vendor/samsung/p6200/vendor.mk)

# Set preferred size for assets
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/tinyalsa-audio.xml:system/etc/tinyalsa-audio.xml \
    $(LOCAL_PATH)/configs/etc/audio_policy.conf:system/etc/audio_policy.conf

# International variants have proximity sensor
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml

# GPS
$(call inherit-product, device/common/gps/gps_eu_supl.mk)
PRODUCT_COPY_FILES += \
    device/samsung/smdk4210-tab/init.smdk4210.gps.rc:root/init.smdk4210.gps.rc \
    device/samsung/smdk4210-tab/configs/etc/gps.cer:system/etc/gps.cer \
    device/samsung/smdk4210-tab/configs/etc/gps.xml:system/etc/gps.xml

# Radio
$(call inherit-product, build/target/product/telephony.mk)
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_PACKAGES += \
    SamsungServiceMode \
    VoiceDialer
