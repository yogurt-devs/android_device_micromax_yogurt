#include "Power.h"

using ::android::hardware::power::V1_0::Status;

namespace vendor::mediatek::hardware::power::implementation {

// Methods from ::android::hardware::power::V1_0::IPower follow.
Return<void> Power::setInteractive(bool /* interactive */) {
    return Void();
}

Return<void> Power::powerHint(::android::hardware::power::V1_0::PowerHint /* hint */, int32_t /* data */) {
    return Void();
}

Return<void> Power::setFeature(::android::hardware::power::V1_0::Feature /* feature */, bool /* activate */) {
    return Void();
}

Return<void> Power::getPlatformLowPowerStats(getPlatformLowPowerStats_cb _hidl_cb) {
    _hidl_cb({}, Status::SUCCESS);

    return Void();
}


// Methods from ::android::hardware::power::V1_1::IPower follow.
Return<void> Power::getSubsystemLowPowerStats(getSubsystemLowPowerStats_cb _hidl_cb) {
    _hidl_cb({}, Status::SUCCESS);

    return Void();
}

Return<void> Power::powerHintAsync(::android::hardware::power::V1_0::PowerHint /* hint */, int32_t /* data */) {
    return Void();
}


// Methods from ::android::hardware::power::V1_2::IPower follow.
Return<void> Power::powerHintAsync_1_2(::android::hardware::power::V1_2::PowerHint /* hint */, int32_t /* data */) {
    return Void();
}


// Methods from ::vendor::mediatek::hardware::power::V2_0::IPower follow.
Return<void> Power::mtkPowerHint(::vendor::mediatek::hardware::power::V2_0::MtkPowerHint /* hint */, int32_t /* data */) {
    return Void();
}

Return<void> Power::mtkCusPowerHint(int32_t /* hint */, int32_t /* data */) {
    return Void();
}

Return<void> Power::notifyAppState(const hidl_string& /* packName */, const hidl_string& /* actName */, int32_t /* pid */, ::vendor::mediatek::hardware::power::V2_0::MtkActState /* state */) {
    return Void();
}

Return<int32_t> Power::querySysInfo(::vendor::mediatek::hardware::power::V2_0::MtkQueryCmd /* cmd */, int32_t /* param */) {
    return 0;
}

Return<int32_t> Power::scnReg() {
    return 0;
}

Return<void> Power::scnConfig(int32_t /* hdl */, ::vendor::mediatek::hardware::power::V2_0::MtkPowerCmd /* cmd */, int32_t /* param1 */, int32_t /* param2 */, int32_t /* param3 */, int32_t /* param4 */) {
    return Void();
}

Return<void> Power::scnUnreg(int32_t /* hdl */) {
    return Void();
}

Return<void> Power::scnEnable(int32_t /* hdl */, int32_t /* timeout */) {
    return Void();
}

Return<void> Power::scnDisable(int32_t /* hdl */) {
    return Void();
}

Return<void> Power::scnUltraCfg(int32_t /* hdl */, int32_t /* ultracmd */, int32_t /* param1 */, int32_t /* param2 */, int32_t /* param3 */, int32_t /* param4 */) {
    return Void();
}

}  // namespace vendor::mediatek::hardware::power::implementation
