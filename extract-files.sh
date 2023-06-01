#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=yogurt
VENDOR=micromax

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

function blob_fixup {
    case "$1" in
        vendor/lib/hw/audio.primary.mt6768.so)
            ;&
        vendor/lib64/hw/audio.primary.mt6768.so)
            patchelf --replace-needed "libxml2.so" "libxml2-v29.so" "${2}"
            patchelf --replace-needed "libmedia_helper.so" "libmedia_helper-v29.so" "${2}"
            ;;
        vendor/bin/hw/android.hardware.audio@5.0-service-mediatek)
            patchelf --replace-needed "libutils.so" "libutils-v30.so" "${2}"
            ;;
        vendor/lib/hw/android.hardware.audio@5.0-impl-mediatek.so)
            patchelf --replace-needed "android.hardware.audio.common@5.0-util.so" "android.hardware.audio.common@5.0-util-v29.so" "${2}"
            ;;
        vendor/bin/hw/android.hardware.wifi@1.0-service-lazy-mediatek)
            patchelf --replace-needed "libwifi-hal.so" "libwifi-hal-mtk.so" "${2}"
            ;;
        vendor/lib64/libarmnn.so)
            ;&
        vendor/bin/hw/android.hardware.neuralnetworks@1.1-service-cpunn)
            patchelf --add-needed "libunwindstack.so" "${2}"
            ;;
        vendor/bin/hw/android.hardware.wifi@1.0-service-lazy-mediatek)
            ;&
        vendor/bin/hw/hostapd)
            ;&
        vendor/bin/hw/wpa_supplicant)
            patchelf --add-needed "libcompiler_rt.so" "${2}"
            ;;
        vendor/lib/libmtkcam_stdutils.so)
            ;&
        vendor/lib64/libmtkcam_stdutils.so)
            patchelf --replace-needed "libutils.so" "libutils-v29.so" "${2}"
            ;;
        vendor/bin/hw/camerahalserver)
            patchelf --replace-needed "libutils.so" "libutils-v30.so" "${2}"
            ;;
        vendor/lib64/hw/android.hardware.camera.provider@2.4-impl-mediatek.so)
            grep -q libshim_camera_metadata.so "$2" || patchelf --add-needed libshim_camera_metadata.so "$2"
            ;;
        vendor/etc/init/android.hardware.bluetooth@1.0-service-mediatek.rc)
            sed -i '/vts/Q' "$2"
            ;;
        vendor/lib64/hw/dfps.mt6768.so)
            patchelf --replace-needed "libutils.so" "libutils-v30.so" "${2}"
            ;;
        vendor/lib64/hw/vendor.mediatek.hardware.pq@2.3-impl.so)
            patchelf --replace-needed "libutils.so" "libutils-v30.so" "${2}"
            ;;
        vendor/lib/libMtkOmxVdecEx.so)
            patchelf --replace-needed "libui.so" "libui-v32.so" "$2"
            ;;
        vendor/bin/hw/android.hardware.keymaster@4.0-service.beanpod)
            patchelf --add-needed "libshim_beanpod.so" "${2}"
            ;;
        lib/libmtk_vt_service.so)
	    patchelf --add-needed "libshim_vtservice.so" "${2}"
	    ;;
	vendor/lib64/libmtkcam_featurepolicy.so)
            # evaluateCaptureConfiguration()
            xxd -p "${2}" | sed 's/28028052/e87740b9/' | xxd -r -p > "${2}".patched
            mv "${2}".patched "${2}"
            ;;
    esac
}

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"

"${MY_DIR}/setup-makefiles.sh"
