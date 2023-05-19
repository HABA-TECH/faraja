import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:haba/utils/widgets/translucentBG.dart';

import '../../utils/TextStyles.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final fieldOne = TextEditingController();
  final fieldTwo = TextEditingController();
  final fieldThree = TextEditingController();
  final fieldFour = TextEditingController();

  String otp = "";
  @override
  void dispose() {
    fieldOne.dispose();
    fieldTwo.dispose();
    fieldThree.dispose();
    fieldFour.dispose();

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
                  child: Text(
                    "OTP",
                    style: TextStyles.light(20),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    "A 4 digit one time pin(OTP) has been sent to your phone number"),
              ),
              Row(
                children: [
                  Text(
                    "07123456789",
                    style: TextStyles.normal().copyWith(
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/edit.svg',
                        height: 25,
                      ),
                      const Text("Edit")
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Please input the number below"),
                ),
              ),
              Container(
                // color: Colors.blueAccent,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    OtpInputField(fieldOne, true),
                    OtpInputField(fieldTwo, false),
                    OtpInputField(fieldThree, false),
                    OtpInputField(fieldFour, false)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Resend OTP",
                      style: TextStyles.normal().copyWith(
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 30),
                    SvgPicture.asset(
                      'assets/icons/edit.svg',
                      height: 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInputField(this.controller, this.autoFocus, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 55,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: AppTheme.primaryColor,
        style: TextStyles.normal().copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(9.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.primaryColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(9.0)),
          ),
          counterText: "",
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
