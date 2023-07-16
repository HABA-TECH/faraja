import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import '../../routes/appRouter.dart';
import '../../utils/colors.dart';

class OnboardingOverview extends StatelessWidget {
  const OnboardingOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();
    return CupertinoOnboarding(
      onPressedOnLastPage: () {
        Navigator.popAndPushNamed(context, AppRouter.register);
        logger.i('To Register screen');
      },
      bottomButtonColor: AppColors.primaryColor,
      pages: [
        // little by little
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
              Container(
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
                title: Text('Quick approval'),
                description: Text(
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
              Container(
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
                title: Text(
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
