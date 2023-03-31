#pragma once

#include <vendor/mediatek/hardware/power/2.1/IPower.h>
#include <hidl/MQDescriptor.h>
#include <hidl/Status.h>

namespace vendor::mediatek::hardware::power::implementation {

using ::android::hardware::hidl_array;
using ::android::hardware::hidl_memory;
using ::android::hardware::hidl_string;
using ::android::hardware::hidl_vec;
using ::android::hardware::Return;
using ::android::hardware::Void;
using ::android::sp;

struct Power : public V2_0::IPower {
    // Methods from ::android::hardware::power::V1_0::IPower follow.
    Return<void> setInteractive(bool interactive) override;
    Return<void> powerHint(::android::hardware::power::V1_0::PowerHint hint, int32_t data) override;
    Return<void> setFeature(::android::hardware::power::V1_0::Feature feature, bool activate) override;
    Return<void> getPlatformLowPowerStats(getPlatformLowPowerStats_cb _hidl_cb) override;

    // Methods from ::android::hardware::power::V1_1::IPower follow.
    Return<void> getSubsystemLowPowerStats(getSubsystemLowPowerStats_cb _hidl_cb) override;
    Return<void> powerHintAsync(::android::hardware::power::V1_0::PowerHint hint, int32_t data) override;

    // Methods from ::android::hardware::power::V1_2::IPower follow.
    Return<void> powerHintAsync_1_2(::android::hardware::power::V1_2::PowerHint hint, int32_t data) override;

    // Methods from ::vendor::mediatek::hardware::power::V2_0::IPower follow.
    Return<void> mtkPowerHint(::vendor::mediatek::hardware::power::V2_0::MtkPowerHint hint, int32_t data) override;
    Return<void> mtkCusPowerHint(int32_t hint, int32_t data) override;
    Return<void> notifyAppState(const hidl_string& packName, const hidl_string& actName, int32_t pid, ::vendor::mediatek::hardware::power::V2_0::MtkActState state) override;
    Return<int32_t> querySysInfo(::vendor::mediatek::hardware::power::V2_0::MtkQueryCmd cmd, int32_t param) override;
    Return<int32_t> scnReg() override;
    Return<void> scnConfig(int32_t hdl, ::vendor::mediatek::hardware::power::V2_0::MtkPowerCmd cmd, int32_t param1, int32_t param2, int32_t param3, int32_t param4) override;
    Return<void> scnUnreg(int32_t hdl) override;
    Return<void> scnEnable(int32_t hdl, int32_t timeout) override;
    Return<void> scnDisable(int32_t hdl) override;
    Return<void> scnUltraCfg(int32_t hdl, int32_t ultracmd, int32_t param1, int32_t param2, int32_t param3, int32_t param4) override;

    // Methods from ::android::hidl::base::V1_0::IBase follow.

};

}  // namespace vendor::mediatek::hardware::power::implementation
