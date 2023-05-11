import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  bool showSkip = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,
          onChange: (value) {
            if (value == 2) {
              setState(() {
                 showSkip = false;
              });
            }else{
              setState(() {
                 showSkip = true;
              });
            }
          },
          globalFooter: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  introKey.currentState?.next();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  minimumSize: const Size(250, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: showSkip ? const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ) :  Text(
                  "Get Started",
                  style: TextStyles.normal(20)
                ),
              ),
              const SizedBox(height: 10),
              showSkip
                  ? const Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    )
                  : const Offstage(),
            ],
          ),
          curve: Curves.bounceInOut,
          safeAreaList: const [true, true, true, true],
          rawPages: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30)
                          .copyWith(top: 10),
                      child: Lottie.asset(
                        'assets/lottie/saving-money.json',
                        height: MediaQuery.of(context).size.height / 2.5,
                      ),
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            // color: Colors.lightBlue,
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: 400,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      'Little by',
                                      style: TextStyles.normal(54),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      'Little fills',
                                      style: TextStyles.normal(54),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      'the pot',
                                      style: TextStyles.normal(54),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      "Swahili Riddle",
                                      style: TextStyles.light(18),
                                      softWrap: true,
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      '"Haba na haba hujaza kibaba"',
                                      style: TextStyles.normalItalic(18),
                                      softWrap: true,
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      'Haba allows you to allocate small income towards your savings,investment and other expenses without a hassle',
                                      style: TextStyles.normal(20),
                                      softWrap: true,
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 50.0),
                            child: SvgPicture.asset(
                              'assets/icons/sparkle.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Lottie.asset(
                        'assets/lottie/tracker.json',
                        height: MediaQuery.of(context).size.height / 2.5,
                      ),
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            // color: Colors.lightBlue,
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: 300,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      'Track your',
                                      style: TextStyles.normal(54),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      'expenses',
                                      style: TextStyles.normal(54),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 40.0),
                                    child: Text(
                                      'Haba analytics allows you to see how much you spend on every expense in detail',
                                      style: TextStyles.normal(20),
                                      softWrap: true,
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: SvgPicture.asset(
                            'assets/icons/sparkle.svg',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: AppTheme.primaryDark,
              // color: Colors.white,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/circles.svg',
                    height: MediaQuery.of(context).size.height / 2.1,
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // color: Colors.lightBlue,
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: 300,
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    'Automate',
                                    style: TextStyles.normal(54).copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    'your',
                                    style: TextStyles.normal(54).copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    'Payments',
                                    style: TextStyles.normal(54).copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Text(
                                    'Integrate once, Forget about it.\nHaba allows you to auto-pay your expenses while you focus on important things.',
                                    style: TextStyles.normal(20).copyWith(color: Colors.white),
                                    softWrap: true,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 15,
                        child: SvgPicture.asset(
                          'assets/icons/sparkle.svg',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          showDoneButton: false,
          showNextButton: false,
          showSkipButton: false,
          dotsDecorator: DotsDecorator(
            size: const Size(30.0, 5),
            activeSize: const Size(30.0, 5),
            activeColor: AppTheme.primaryColor,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
          controlsPosition: const Position(left: 0, right: 0, bottom: 30),
          dotsFlex: 2,
        ),
      ),
    );
  }
}
