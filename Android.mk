#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),yogurt)
subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
  $(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

VENDOR_SYMLINKS := \
    $(TARGET_OUT_VENDOR)/lib/hw \
    $(TARGET_OUT_VENDOR)/lib64/hw

$(VENDOR_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Making vendor symlinks"
	@mkdir -p $(TARGET_OUT_VENDOR)/lib/hw
	@mkdir -p $(TARGET_OUT_VENDOR)/lib64/hw
	@ln -sf libSoftGatekeeper.so $(TARGET_OUT_VENDOR)/lib/hw/gatekeeper.default.so
	@ln -sf libSoftGatekeeper.so $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.default.so
	@ln -sf /vendor/lib/egl/libGLES_mali.so $(TARGET_OUT_VENDOR)/lib/hw/vulkan.mt6768.so
	@ln -sf /vendor/lib64/egl/libGLES_mali.so $(TARGET_OUT_VENDOR)/lib64/hw/vulkan.mt6768.so
	$(hide) touch $@

ALL_DEFAULT_INSTALLED_MODULES += $(VENDOR_SYMLINKS)

endif
