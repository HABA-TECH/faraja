import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:haba/routes/appRouter.dart';
import 'package:haba/services/data/sharedPreferences.dart';
import 'package:haba/utils/widgets/custom_textfield.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:haba/utils/colors.dart';
import 'package:haba/utils/widgets/translucentBG.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/TextStyles.dart';
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

  @override
  void initState() {
    super.initState();
    loadData();
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
    passwordController.dispose();
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
                      child: Text(
                        "Please input the One Time PIN sent to your phone number",
                        style: TextStyles.h1(12, Colors.grey[800]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: OtpTextField(
                        numberOfFields: 5,
                        borderColor: AppColors.primaryColor,
                        fillColor: AppColors.primaryColor,
                        enabledBorderColor: AppColors.primaryColor,
                        disabledBorderColor: AppColors.primaryColor,

                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Verification Code"),
                                  content:
                                      Text('Code entered is $verificationCode'),
                                );
                              });
                        }, // end onSubmit
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 90.0),
                      child: CustomButton(
                        buttonText: 'Submit',
                        onPressed: () {
                          Navigator.pushNamed(context, AppRouter.login);
                        },
                        width: MediaQuery.of(context).size.width * .9,
                        height: 50,
                        radius: 20,
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
