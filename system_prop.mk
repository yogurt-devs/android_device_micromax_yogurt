# Display
PRODUCT_PRODUCT_PROPERTIES += \
    ro.sf.lcd_density=480

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
