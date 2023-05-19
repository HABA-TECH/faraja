import 'package:flutter/material.dart';
import 'package:haba/utils/widgets/custom_button.dart';
import 'package:haba/utils/widgets/translucentBG.dart';

import '../../utils/AppTheme.dart';
import '../../utils/TextStyles.dart';
import '../../utils/widgets/custom_textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/backgroundimage.png',
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: TranslucentContainer(
            list: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text("FORGOT PASSWORD", style: TextStyles.light(20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.only(bottom: 3),
                      child: Text("Phone"),
                    ),
                    CustomTextField(
                      hintText: "eg 0712345678",
                      controller: phoneController,
                      inputType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Please share the phone number you used to register your account",
                  style: TextStyles.normal().copyWith(
                    color: AppTheme.hintTextColor,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    onPressed: () {},
                    buttonText: "Submit",
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    radius: 29,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
