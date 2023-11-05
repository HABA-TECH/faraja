import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:haba/routes/appRouter.dart';
import 'package:haba/utils/colors.dart';
import 'package:haba/utils/widgets/translucentBG.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../utils/TextStyles.dart';
import '../../utils/ads_widgets/ads_widget.dart';
import '../../utils/widgets/custom_button.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final idNumController = TextEditingController();

  late String phoneNum = 'abc';
  late String email = '';
  late String lastName = '';
  late String firstName = '';
  String? generatedNumber;

  void generateNumber() {
    setState(() {
      generatedNumber = (Random().nextInt(90000) + 10000).toString();
    });
  }

// =================================================================
  String _code = "";
  // String signature = "{{ app signature }}";
// =================================================================
  @override
  void initState() {
    generateNumber();
    startTimer();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          _code = generatedNumber!;
        });
      },
    );
    loadData();
    // TODO: implement initState
    super.initState();
  }

  int remainingSeconds = 30;
  Timer? timer;
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          timer!.cancel();
        }
      });
    });
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      phoneNum = prefs.getString('phone') ?? '0711';
      email = prefs.getString('email') ?? 'test@gmail.com';
      lastName = prefs.getString('lastName') ?? 'Kamau';
      firstName = prefs.getString('firstName') ?? 'John';
      // prefs.setString('lastName', lastName);
      // prefs.setString('email', email);
      // prefs.setString('phone', phone);
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    startTimer();
    passwordController.dispose();
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  // Future<UserData> getData() async {
  //   return await DataService().getData();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/backgroundimage.png',
                    ))),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: TranslucentContainer(
                  list: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("OTP", style: TextStyles.h2(20)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  "A 4 digit one time pin (OTP) has been sent to \nyour phone number",
                                  style: TextStyles.h1(12, Colors.grey[800]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Text(
                            " $phoneNum",
                            style: TextStyles.h1(12, AppColors.primaryColor),
                          ),
                          const Icon(Icons.edit, color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              "Edit",
                              style: TextStyles.h1(12, AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "A one time pin has been sent to initialized.",
                            style: TextStyles.h1(12, Colors.grey[800]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 28.0),
                            child: Text(
                              remainingSeconds.toString(),
                              style: TextStyles.h1(12, AppColors.greyPAGEBLUE),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    PinFieldAutoFill(
                      codeLength: 5,
                      decoration: UnderlineDecoration(
                        textStyle:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        colorBuilder:
                            FixedColorBuilder(AppColors.greyPAGEBLUE!),
                      ),
                      currentCode: _code,
                      onCodeSubmitted: (code) {},
                      onCodeChanged: (code) {
                        if (code!.length == 5) {
                          FocusScope.of(context).requestFocus(FocusNode());
                        }
                      },
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: CustomButton(
                        buttonText: 'Submit',
                        onPressed: () {
                          ShowInterstitialAd().showAd(context);
                          Navigator.pushNamed(context, AppRouter.login);
                        },
                        width: MediaQuery.of(context).size.width * .9,
                        height: 50,
                        radius: 20,
                      ),
                    ),
                    const ShowBannerAd(),
                    // ShowInterstitialAd().showAd(context);
                    const Spacer(),
                  ],
                ))),
      ),
    );
  }
}
