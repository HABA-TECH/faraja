import 'package:flutter/material.dart';
import 'package:haba/routes/appRouter.dart';
import 'package:haba/utils/widgets/custom_button.dart';
import 'package:logger/logger.dart';

import '../../utils/TextStyles.dart';
import '../../utils/widgets/custom_textfield.dart';
import '../../utils/widgets/translucentBG.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final idNumberController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    idNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Material(
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
                        child: Text("PERSONAL INFORMATION",
                            style: TextStyles.light(20)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.blueAccent,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(bottom: 3),
                                    child: Text("First Name"),
                                  ),
                                  CustomTextField(
                                    hintText: "eg John",
                                    controller: firstNameController,
                                    inputType: TextInputType.emailAddress,
                                    obscureText: false,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(bottom: 3),
                                    child: Text("Last Name"),
                                  ),
                                  CustomTextField(
                                    hintText: "eg Smith",
                                    controller: lastNameController,
                                    inputType: TextInputType.emailAddress,
                                    obscureText: false,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(bottom: 3),
                                    child: Text("Phone"),
                                  ),
                                  CustomTextField(
                                    hintText: "eg 07123456789",
                                    controller: phoneController,
                                    inputType: TextInputType.emailAddress,
                                    obscureText: false,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(bottom: 3),
                                    child: Text("Id Number"),
                                  ),
                                  CustomTextField(
                                    hintText: "ID Number",
                                    controller: idNumberController,
                                    inputType: TextInputType.emailAddress,
                                    obscureText: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                      child: CustomButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRouter.otp);
                          Logger logger = Logger();
                          logger.i("To OTP page");
                        },
                        buttonText: "Submit",
                        width: MediaQuery.of(context).size.width,
                        radius: 29,
                        height: 50,
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
