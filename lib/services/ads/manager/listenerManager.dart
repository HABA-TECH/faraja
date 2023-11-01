import 'package:anythink_sdk/at_index.dart';
import 'package:flutter/foundation.dart';

class ListenerTool {
  rewarderListen() {
    ATListenerManager.rewardedVideoEventHandler.listen((value) {
      switch (value.rewardStatus) {
        case RewardedStatus.rewardedVideoDidFailToLoad:
          debugPrint(
              "flutter rewardedVideoDidFailToLoad ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}");
          break;
        case RewardedStatus.rewardedVideoDidFinishLoading:
          debugPrint(
              "flutter rewardedVideoDidFinishLoading ---- placementID: ${value.placementID}");
          break;
        case RewardedStatus.rewardedVideoDidStartPlaying:
          debugPrint(
              "flutter rewardedVideoDidStartPlaying ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidEndPlaying:
          debugPrint(
              "flutter rewardedVideoDidEndPlaying ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidFailToPlay:
          debugPrint(
              "flutter rewardedVideoDidFailToPlay ---- placementID: ${value.placementID} ---- errStr:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidRewardSuccess:
          debugPrint(
              "flutter rewardedVideoDidRewardSuccess ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidClick:
          debugPrint(
              "flutter rewardedVideoDidClick ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidDeepLink:
          debugPrint(
              "flutter rewardedVideoDidDeepLink ---- placementID: ${value.placementID} ---- extra:${value.extraMap} ---- isDeeplinkSuccess:${value.isDeeplinkSuccess}");
          break;
        case RewardedStatus.rewardedVideoDidClose:
          debugPrint(
              "flutter rewardedVideoDidClose ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoUnknown:
          debugPrint("flutter rewardedVideoUnknown");
          break;

        case RewardedStatus.rewardedVideoDidAgainStartPlaying:
          debugPrint(
              "flutter rewardedVideoDidAgainStartPlaying ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidAgainEndPlaying:
          debugPrint(
              "flutter rewardedVideoDidAgainEndPlaying ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidAgainFailToPlay:
          debugPrint(
              "flutter rewardedVideoDidAgainFailToPlay ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidAgainRewardSuccess:
          debugPrint(
              "flutter rewardedVideoDidAgainRewardSuccess ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidAgainClick:
          debugPrint(
              "flutter rewardedVideoDidAgainClick ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
      }
    });
  }

  interListen() {
    ATListenerManager.interstitialEventHandler.listen((value) {
      switch (value.interstatus) {
        case InterstitialStatus.interstitialAdFailToLoadAD:
          debugPrint(
              "flutter interstitialAdFailToLoadAD ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}");
          break;
        case InterstitialStatus.interstitialAdDidFinishLoading:
          debugPrint(
              "flutter interstitialAdDidFinishLoading ---- placementID: ${value.placementID}");
          break;
        case InterstitialStatus.interstitialAdDidStartPlaying:
          debugPrint(
              "flutter interstitialAdDidStartPlaying ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case InterstitialStatus.interstitialAdDidEndPlaying:
          debugPrint(
              "flutter interstitialAdDidEndPlaying ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case InterstitialStatus.interstitialDidFailToPlayVideo:
          debugPrint(
              "flutter interstitialDidFailToPlayVideo ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}");
          break;
        case InterstitialStatus.interstitialDidShowSucceed:
          debugPrint(
              "flutter interstitialDidShowSucceed ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case InterstitialStatus.interstitialFailedToShow:
          debugPrint(
              "flutter interstitialFailedToShow ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}");
          break;
        case InterstitialStatus.interstitialAdDidClick:
          debugPrint(
              "flutter interstitialAdDidClick ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case InterstitialStatus.interstitialAdDidDeepLink:
          debugPrint(
              "flutter interstitialAdDidDeepLink ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case InterstitialStatus.interstitialAdDidClose:
          debugPrint(
              "flutter interstitialAdDidClose ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case InterstitialStatus.interstitialUnknown:
          debugPrint("flutter interstitialUnknown");
          break;
      }
    });
  }

  bannerListen() {
    ATListenerManager.bannerEventHandler.listen((value) {
      switch (value.bannerStatus) {
        case BannerStatus.bannerAdFailToLoadAD:
          debugPrint(
              "flutter bannerAdFailToLoadAD ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}");
          break;
        case BannerStatus.bannerAdDidFinishLoading:
          debugPrint(
              "flutter bannerAdDidFinishLoading ---- placementID: ${value.placementID}");
          break;
        case BannerStatus.bannerAdAutoRefreshSucceed:
          debugPrint(
              "flutter bannerAdAutoRefreshSucceed ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case BannerStatus.bannerAdDidClick:
          debugPrint(
              "flutter bannerAdDidClick ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case BannerStatus.bannerAdDidDeepLink:
          debugPrint(
              "flutter bannerAdDidDeepLink ---- placementID: ${value.placementID} ---- extra:${value.extraMap} ---- isDeeplinkSuccess:${value.isDeeplinkSuccess}");
          break;
        case BannerStatus.bannerAdDidShowSucceed:
          debugPrint(
              "flutter bannerAdDidShowSucceed ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case BannerStatus.bannerAdTapCloseButton:
          debugPrint(
              "flutter bannerAdTapCloseButton ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case BannerStatus.bannerAdAutoRefreshFail:
          debugPrint(
              "flutter bannerAdAutoRefreshFail ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}");
          break;
        case BannerStatus.bannerAdUnknown:
          debugPrint("flutter bannerAdUnknown");
          break;
      }
    });
  }

  nativeListen() {
    ATListenerManager.nativeEventHandler.listen((value) {
      switch (value.nativeStatus) {
        case NativeStatus.nativeAdFailToLoadAD:
          debugPrint(
              "flutter nativeAdFailToLoadAD ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}");
          break;
        case NativeStatus.nativeAdDidFinishLoading:
          debugPrint(
              "flutter nativeAdDidFinishLoading ---- placementID: ${value.placementID}");
          break;
        case NativeStatus.nativeAdDidClick:
          debugPrint(
              "flutter nativeAdDidClick ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdDidDeepLink:
          debugPrint(
              "flutter nativeAdDidDeepLink ---- placementID: ${value.placementID} ---- extra:${value.extraMap} ---- isDeeplinkSuccess:${value.isDeeplinkSuccess}");
          break;
        case NativeStatus.nativeAdDidEndPlayingVideo:
          debugPrint(
              "flutter nativeAdDidEndPlayingVideo ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdEnterFullScreenVideo:
          debugPrint(
              "flutter nativeAdEnterFullScreenVideo ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdExitFullScreenVideoInAd:
          debugPrint(
              "flutter nativeAdExitFullScreenVideoInAd ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdDidShowNativeAd:
          debugPrint(
              "flutter nativeAdDidShowNativeAd ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdDidStartPlayingVideo:
          debugPrint(
              "flutter nativeAdDidStartPlayingVideo ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdDidTapCloseButton:
          debugPrint(
              "flutter nativeAdDidTapCloseButton ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdDidCloseDetailInAdView:
          debugPrint(
              "flutter nativeAdDidCloseDetailInAdView ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdDidLoadSuccessDraw:
          debugPrint(
              "flutter nativeAdDidLoadSuccessDraw ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdUnknown:
          debugPrint("flutter downloadUnknown");
          break;
      }
    });
  }

  downLoadListen() {
    ATListenerManager.downloadEventHandler.listen((value) {
      switch (value.downloadStatus) {
        case DownloadStatus.downloadStart:
          debugPrint(
              "flutter downloadStart ---- placementID: ${value.placementID}, totalBytes: ${value.totalBytes}, currBytes: ${value.currBytes}, "
              "fileName: ${value.fileName}, appName: ${value.appName}, extra: ${value.extraMap}");
          break;
        case DownloadStatus.downloadUpdate:
          debugPrint(
              "flutter downloadUpdate ---- placementID: ${value.placementID}, totalBytes: ${value.totalBytes}, currBytes: ${value.currBytes}, "
              "fileName: ${value.fileName}, appName: ${value.appName}, extra: ${value.extraMap}");
          break;
        case DownloadStatus.downloadPause:
          debugPrint(
              "flutter downloadPause ---- placementID: ${value.placementID}, totalBytes: ${value.totalBytes}, currBytes: ${value.currBytes}, "
              "fileName: ${value.fileName}, appName: ${value.appName}, extra: ${value.extraMap}");
          break;
        case DownloadStatus.downloadFinished:
          debugPrint(
              "flutter downloadFinished ---- placementID: ${value.placementID}, totalBytes: ${value.totalBytes}, "
              "fileName: ${value.fileName}, appName: ${value.appName}, extra: ${value.extraMap}");
          break;
        case DownloadStatus.downloadFailed:
          debugPrint(
              "flutter downloadFailed ---- placementID: ${value.placementID}, totalBytes: ${value.totalBytes}, currBytes: ${value.currBytes}, "
              "fileName: ${value.fileName}, appName: ${value.appName}, extra: ${value.extraMap}");
          break;
        case DownloadStatus.downloadInstalled:
          debugPrint(
              "flutter downloadInstalled ---- placementID: ${value.placementID}, "
              "fileName: ${value.fileName}, appName: ${value.appName}, extra: ${value.extraMap}");
          break;
        case DownloadStatus.downloadUnknown:
          debugPrint("flutter downloadUnknow");
          break;
      }
    });
  }
}
