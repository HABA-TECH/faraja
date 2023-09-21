import 'package:flutter/material.dart';
import 'package:haba/routes/appRouter.dart';
import 'package:haba/utils/widgets/custom_textfield.dart';
import 'package:haba/utils/widgets/translucentBG.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/TextStyles.dart';
import '../../utils/paddingUtil.dart';
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
  bool isChecked = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
// FirebaseAuth auth = FirebaseAuth.instance;

// await auth.verifyPhoneNumber(
//   phoneNumber: '+44 7123 123 456',
//   verificationCompleted: (PhoneAuthCredential credential) async {
//     // ANDROID ONLY!

//     // Sign the user in (or link) with the auto-generated credential
//     await auth.signInWithCredential(credential);
//   },
// );
  void setData(firsrName, lastName, idNum) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('firstName', firsrName);
    prefs.setString('lastName', lastName);
    // prefs.setString('phone', phone);
    prefs.setString('idNumber', idNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Material(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/backgroundimage.png',
                              ))),
                    ),
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: TranslucentContainer(
                          height: MediaQuery.of(context).size.height * .7,
                          list: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text("PERSONAL INFORMATION",
                                    style: TextStyles.h2(20)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomTextField(
                                text: 'First Name',
                                hintText: "eg John",
                                controller: firstNameController,
                                inputType: TextInputType.name,
                                obscureText: false,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomTextField(
                                text: 'Last Name',
                                hintText: "eg Kamau",
                                controller: lastNameController,
                                inputType: TextInputType.text,
                                obscureText: false,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomTextField(
                                text: 'Phone',
                                hintText: "eg 0712234567",
                                controller: phoneNumberController,
                                inputType: TextInputType.phone,
                                obscureText: false,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomTextField(
                                hintText: "ID Number",
                                text: 'ID Number',
                                controller: idNumController,
                                inputType: TextInputType.number,
                                obscureText: false,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Checkbox(
                                      value: isChecked,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(right: 28.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            showMaterialModalBottomSheet(
                                              expand: false,
                                              context: context,
                                              backgroundColor:
                                                  Colors.transparent,
                                              builder: (context) =>
                                                  SingleChildScrollView(
                                                child: Container(
                                                  // color: Colors.white,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      1.2,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(25.0),
                                                      topRight:
                                                          Radius.circular(25.0),
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                    ),
                                                  ),

                                                  child: Column(
                                                    children: [
                                                      // top section
                                                      Padding(
                                                        padding: AppPadding
                                                            .regularPadding,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                'Terms and Conditions',
                                                                style: TextStyles
                                                                    .title(),
                                                              ),
                                                            ),
                                                            Column(
                                                              children: [
                                                                IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .close_sharp),
                                                                ),
                                                                const Text(
                                                                    'Close'),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),

                                                      Padding(
                                                        padding: AppPadding
                                                            .regularPadding,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            "Please accept our terms and conditions",
                                                            style: TextStyles
                                                                .normal(
                                                              15,
                                                              Colors.grey[800],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: AppPadding
                                                            .regularPadding,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            """Please read carefully before using this service.
                                    Faraja Creditors
                                    We enable you to qualify to borrow small amounts over a short period of time.
                                    TERMS OF SERVICE.
                                    1. This is a contract.
                                    These Terms constitute a contract. You may not use the service if you do not accept these terms. If you are under eighteen (18) years of age, you may not use the service
                                    2. If you fail to repay, you will be in default.
                                    If you still have not repaid the loan amount and fees, by the end of the Rollover period, you will be in default.
                                    3. Our fee is payable on top of the amount you borrow.
                                    Following the account registration process, you may be offered the opportunity to apply for loans in certain amounts. We reserve the right to decline the loan application for any reason. However, if we accept your application and grant you a loan we will charge a fee you must pay to us on top of paying back the borrowed amount.
                                    4. The service is provided without any warranties or guarantees.
                                    The service is provided without warranty of ant kind. If you are dissatisfied with any portion of the service, or with these terms, your sole and exclusive remedy is to discontinue using the service.
                                    5. We may modify these Terms.
                                    These terms may be modified without notice at any time in the future. It is your responsibility to remain informed of any changes as you are bound by the latest version of the terms..""",
                                                            style: TextStyles
                                                                .normal(
                                                              15,
                                                              Colors.grey[800],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Please accept our terms and conditions",
                                            style: TextStyles.h1(
                                                12, Colors.grey[800]),
                                          ),
                                        )
                                        // GestureDetector(
                                        //   onTap: () {

                                        //   },

                                        // ),
                                        ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: CustomButton(
                                buttonText: 'Submit',
                                onPressed: () {
                                  try {
                                    setData(
                                      firstNameController.text,
                                      lastNameController.text,
                                      // phoneNumberController.text,
                                      idNumController.text,
                                    );
                                    print('ADDED');
                                    Navigator.pushNamed(
                                        context, AppRouter.otpField);
                                  } catch (e) {
                                    print('Error adding data: $e');
                                  }
                                },
                                width: MediaQuery.of(context).size.width * .9,
                                height: 50,
                                radius: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
