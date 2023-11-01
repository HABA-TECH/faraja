import 'package:anythink_sdk/at_index.dart';
import 'package:haba/services/ads/ad_config.dart';

class InterstitialTool {
  static Future loadInterstitialAd() async {
    await ATInterstitialManager.loadInterstitialAd(
        placementID: AdConfig.interstitialPlacementID,
        extraMap: {
          // Sigmob rewarded video ----> Interstitial ads
          // ATInterstitialManager.useRewardedVideoAsInterstitialKey(): true
        });
  }

  static Future interstitialAdcheck() async {
    await hasInterstitialAdReady();
    await getInterstitialValidAds();
    await checkInterstitialLoadStatus();
  }

  static Future hasInterstitialAdReady() async {
    await ATInterstitialManager.hasInterstitialAdReady(
      placementID: AdConfig.interstitialPlacementID,
    ).then((value) {
      print('flutter hasInterstitialAdReady: $value');
    });
  }

  static Future getInterstitialValidAds() async {
    await ATInterstitialManager.getInterstitialValidAds(
      placementID: AdConfig.interstitialPlacementID,
    ).then((value) {
      print('flutter getInterstitialValidAds: $value');
    });
  }

  static Future checkInterstitialLoadStatus() async {
    await ATInterstitialManager.checkInterstitialLoadStatus(
      placementID: AdConfig.interstitialPlacementID,
    ).then((value) {
      print('flutter checkInterstitialLoadStatus: $value');
    });
  }

  static Future showInterstitialAd() async {
    await ATInterstitialManager.showInterstitialAd(
      placementID: AdConfig.interstitialPlacementID,
    );
  }
}
