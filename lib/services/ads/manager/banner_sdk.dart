import 'package:anythink_sdk/at_index.dart';
import 'package:haba/services/ads/ad_config.dart';
import 'package:haba/utils/topsize.dart';

class BannerTool {
  static Future loadBannerAd() async {
    await ATBannerManager.loadBannerAd(
        placementID: AdConfig.bannerPlacementID,
        extraMap: {
          ATCommon.isNativeShow(): true,
          ATCommon.getAdSizeKey(): ATBannerManager.createLoadBannerAdSize(
            TopSize().getWidth(),
            TopSize().getWidth() * (50 / 320),
          ),
          ATBannerManager.getAdaptiveOrientationKey():
              ATBannerManager.adaptiveOrientationCurrent(),
        });
  }

  static Future bannerAdcheck() async {
    return ATBannerManager.checkBannerLoadStatus(
            placementID: AdConfig.bannerPlacementID)
        .then((value) => print('flutter checkBannerLoadStatus: $value'));
  }

  static Future showBannerAd() async {
    await ATBannerManager.bannerAdReady(placementID: AdConfig.bannerPlacementID)
        .then((value) {
      if (value) {
        ATBannerManager.showBannerInRectangle(
          placementID: AdConfig.bannerPlacementID,
          extraMap: {
            ATCommon.getAdSizeKey():
                ATBannerManager.createLoadBannerAdSize(400, 500, x: 0, y: 200),
          },
        );
      }
    });
  }
}
