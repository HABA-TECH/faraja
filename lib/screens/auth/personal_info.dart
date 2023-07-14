import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haba/routes/appRouter.dart';
import 'package:haba/utils/widgets/custom_textfield.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:haba/utils/colors.dart';
import 'package:haba/utils/widgets/translucentBG.dart';

import '../../utils/TextStyles.dart';
import '../../utils/widgets/custom_button.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final idNumController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                        child: Text("PERSONAL INFORMATION",
                            style: TextStyles.h2(20)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CustomTextField(
                        text: 'First Name',
                        hintText: "eg John",
                        controller: firstNameController,
                        inputType: TextInputType.name,
                        obscureText: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CustomTextField(
                        text: 'Last Name',
                        hintText: "eg Kamau",
                        controller: lastNameController,
                        inputType: TextInputType.text,
                        obscureText: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CustomTextField(
                        text: 'Phone',
                        hintText: "eg 0712234567",
                        controller: phoneNumberController,
                        inputType: TextInputType.phone,
                        obscureText: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CustomTextField(
                        hintText: "ID Number",
                        text: 'ID Number',
                        controller: idNumController,
                        inputType: TextInputType.number,
                        obscureText: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: CustomButton(
                        buttonText: 'Submit',
                        onPressed: () {
                          Navigator.pushNamed(context, AppRouter.otpField);
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
