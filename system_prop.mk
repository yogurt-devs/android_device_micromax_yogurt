# Display
PRODUCT_PRODUCT_PROPERTIES += \
    ro.sf.lcd_density=480 \
    qemu.hw.mainkeys=0 \
    ro.opengles.version=196610

# MTK Performance
PRODUCT_PRODUCT_PROPERTIES += \
    ro.mtk_perf_simple_start_win=1 \
    ro.mtk_perf_fast_start_win=1 \
    ro.mtk_perf_response_time=1

# Media
PRODUCT_PRODUCT_PROPERTIES += \
    media.stagefright.thumbnail.prefer_hw_codecs=true

# Camera
PRODUCT_PRODUCT_PROPERTIES += \
    persist.camera.HAL3.enabled=1

# WFD
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.wfd.nohdcp=1 \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0

# IMS
PRODUCT_PRODUCT_PROPERTIES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1 \
    persist.dbg.ims_volte_enable=1 \
    persist.radio.rat_on=combine \
    persist.radio.data_ltd_sys_ind=1 \
    persist.radio.data_con_rprt=1 \
    persist.radio.calls.on.ims=1

# Kernel
PRODUCT_PRODUCT_PROPERTIES += \
    ro.kernel.zio=38,108,105,16

# Wifi
PRODUCT_PRODUCT_PROPERTIES += \
    wifi.tethering.interface=ap0 \
    wifi.direct.interface=p2p0 \
    wifi.interface=wlan0 \
    ro.mediatek.wlan.wsc=1 \
    ro.mediatek.wlan.p2p=1 \
    mediatek.wlan.ctia=0

# Audio
PRODUCT_PRODUCT_PROPERTIES += \
    ro.camera.sound.forced=0 \
    ro.audio.silent=0

# USB
PRODUCT_PRODUCT_PROPERTIES += \
    ro.sys.usb.storage.type=mtp \
    ro.sys.usb.mtp.whql.enable=0 \
    ro.sys.usb.charging.only=yes \
    ro.sys.usb.bicr=no

# Dex2oat
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    dalvik.vm.image-dex2oat-filter=quicken \
    dalvik.vm.image-dex2oat-threads=8 \
    dalvik.vm.image-dex2oat-cpu-set=0,1,2,3,4,5,6,7 \
    dalvik.vm.dex2oat-filter=quicken \
    dalvik.vm.dex2oat-threads=8 \
    dalvik.vm.dex2oat-cpu-set=0,1,2,3,4,5,6,7 \
    dalvik.vm.boot-dex2oat-threads=8 \
    dalvik.vm.boot-dex2oat-cpu-set=0,1,2,3,4,5,6,7
