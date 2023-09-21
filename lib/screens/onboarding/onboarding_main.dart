import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:flutter/cupertino.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import '../../routes/appRouter.dart';
import '../../utils/colors.dart';

class OnboardingOverview extends StatefulWidget {
  const OnboardingOverview({
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingOverview> createState() => _OnboardingOverviewState();
}

bool _isInterstitialAdLoaded = false;
_showInterstitialAd() {
  if (_isInterstitialAdLoaded == true) {
    FacebookInterstitialAd.showInterstitialAd();
  } else {
    print("Interstial Ad not yet loaded!");
  }
}

void _loadInterstitialAd() {
  FacebookInterstitialAd.loadInterstitialAd(
    // placementId: "YOUR_PLACEMENT_ID",
    placementId: "b64c03441d0785",
    listener: (result, value) {
      print(">> FAN > Interstitial Ad: $result --> $value");
      if (result == InterstitialAdResult.LOADED) _isInterstitialAdLoaded = true;

      /// Once an Interstitial Ad has been dismissed and becomes invalidated,
      /// load a fresh Ad by calling this function.
      if (result == InterstitialAdResult.DISMISSED &&
          value["invalidated"] == true) {
        _isInterstitialAdLoaded = false;
        // _loadInterstitialAd();
      }
    },
  );
}

class _OnboardingOverviewState extends State<OnboardingOverview> {
  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();
    return CupertinoOnboarding(
      // onPressed: () {},
      onPressedOnLastPage: () {
        Navigator.popAndPushNamed(context, AppRouter.login);
        logger.i('To Register screen');
      },
      bottomButtonColor: AppColors.primaryColor,
      pages: [
        Align(
          child: WhatsNewPage(
            title: Text(
              "Low\ninterest",
              textAlign: TextAlign.center,
              style: TextStyles.h2(35),
            ),
            features: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 200,
                // color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30)
                      .copyWith(top: 10),
                  child: Lottie.asset(
                    'assets/lottie/tracker.json',
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                ),
              ),
              WhatsNewFeature(
                title: const Text('Low interest rates'),
                description: const Text(
                  '',
                ),
                icon: Icon(
                  CupertinoIcons.sparkles,
                  color: AppColors.primaryColor,
                ),
              ),
              const WhatsNewFeature(
                title: Text(
                  "Faraja Credit allows you to get quick loans with low interest rates",
                ),
                description: Text(''),
                icon: Icon(
                  CupertinoIcons.paintbrush,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),

        // Tracker
        Align(
          child: WhatsNewPage(
            title: Text(
              "Easy Quick access to loans",
              textAlign: TextAlign.center,
              style: TextStyles.h2(35),
            ),
            features: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 200,
                // color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30)
                      .copyWith(top: 10),
                  child: Lottie.asset(
                    'assets/lottie/saving-money.json',
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                ),
              ),
              WhatsNewFeature(
                title: const Text('Quick approval'),
                description: const Text(
                  ' ',
                ),
                icon: Icon(CupertinoIcons.sparkles,
                    color: AppColors.primaryColor),
              ),
              const WhatsNewFeature(
                title: Text(
                  "With Faraja finance, you can access upto Ksh 50,000 with fast approval time",
                ),
                description: Text(''),
                icon: Icon(
                  CupertinoIcons.paintbrush,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),

        // Automate
        Align(
          child: WhatsNewPage(
            title: Text(
              "Flexible\nRepayments",
              textAlign: TextAlign.center,
              style: TextStyles.h2(35),
            ),
            features: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 200,
                // color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30)
                      .copyWith(top: 10),
                  child: Lottie.asset(
                    'assets/lottie/automate.json',
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                ),
              ),
              WhatsNewFeature(
                title: const Text(
                  "Pay at your own pace",
                ),
                description: const Text(
                  ' ',
                ),
                icon: Icon(CupertinoIcons.sparkles,
                    color: AppColors.primaryColor),
              ),
              const WhatsNewFeature(
                title: Text(
                    "Faraja Credit allows you to pay your loan at flexible repayment period of of upto 6 months"),
                description: Text(''),
                icon: Icon(
                  CupertinoIcons.paintbrush,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
