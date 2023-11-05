import 'package:flutter/material.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:logger/logger.dart';

import '../../services/ads/ad_config.dart';

class ShowBannerAd extends StatefulWidget {
  const ShowBannerAd({super.key});

  @override
  State<ShowBannerAd> createState() => _ShowBannerAdState();
}

class _ShowBannerAdState extends State<ShowBannerAd> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FacebookBannerAd(
        placementId: AdConfig.bannerPlacementID,
        bannerSize: BannerSize.STANDARD,
        listener: (result, value) {
          switch (result) {
            case BannerAdResult.ERROR:
              print("Error: $value");
              break;
            case BannerAdResult.LOADED:
              print("Loaded: $value");
              break;
            case BannerAdResult.CLICKED:
              print("Clicked: $value");
              break;
            case BannerAdResult.LOGGING_IMPRESSION:
              print("Logging Impression: $value");
              break;
          }
        },
      ),
    );
  }
}

class ShowInterstitialAd {
  Future showAd(context) async {
    Logger().i('Initializing ShowInterstitial');

    return await FacebookInterstitialAd.loadInterstitialAd(
      placementId: AdConfig.interstitialPlacementID,
      listener: (result, value) {
        if (result == InterstitialAdResult.LOADED) {
          FacebookInterstitialAd.showInterstitialAd(delay: 5000);
        }
      },
    );
  }
}
