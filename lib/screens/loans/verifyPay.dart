import 'dart:io';

import 'package:flutter/material.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:haba/utils/paddingUtil.dart';
import 'package:haba/utils/widgets/doublesidedContainer.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:launch_review/launch_review.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/appRouter.dart';
import '../../utils/colors.dart';
import '../../utils/widgets/custom_button.dart';
import '../../utils/widgets/custom_textfield.dart';

class VerifyPay extends StatefulWidget {
  const VerifyPay({super.key});

  @override
  State<VerifyPay> createState() => _VerifyPayState();
}

class _VerifyPayState extends State<VerifyPay> {
  @override
  final verifyPayController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool? verifyPay = false;
  bool? submitted = false;
  final InAppReview _inAppReview = InAppReview.instance;
  Future<void> _requestReview() => _inAppReview.requestReview();
  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();

    // =================================================================
    String _appStoreId = 'com.starplay.spider.fighter3d';
    String _microsoftStoreId = '';
    Availability _availability = Availability.loading;

    @override
    void initState() {
      super.initState();

      (<T>(T? o) => o!)(WidgetsBinding.instance)
          .addPostFrameCallback((_) async {
        try {
          final isAvailable = await _inAppReview.isAvailable();

          setState(() {
            // This plugin cannot be tested on Android by installing your app
            // locally. See https://github.com/britannio/in_app_review#testing for
            // more information.
            _availability = isAvailable && !Platform.isAndroid
                ? Availability.available
                : Availability.unavailable;
          });
        } catch (_) {
          setState(() => _availability = Availability.unavailable);
        }
      });
    }

    void _setAppStoreId(String id) => _appStoreId = id;

    void _setMicrosoftStoreId(String id) => _microsoftStoreId = id;

    Future<void> _requestReview() => _inAppReview.requestReview();

    Future<void> _openStoreListing() => _inAppReview.openStoreListing(
          appStoreId: _appStoreId,
          microsoftStoreId: _microsoftStoreId,
        );
    // =================================================================
  }

  setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('verified', verifyPay!);
    print('verified pay ${verifyPay}');
  }

  @override
  void dispose() {
    // Clean up the focus nodex when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();
  }

  late FocusNode myFocusNode;
  final InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(
      color: AppColors.greyPAGEBLUE!,
      width: 1.2,
      strokeAlign: BorderSide.strokeAlignCenter,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.grey[200],
              height: MediaQuery.of(context).size.height,
            ),
            Padding(
              padding: AppPadding.regularPadding,
              child: Container(
                color: Colors.grey[200],
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Verify Pay',
                        style: TextStyles.title(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Please Paste your MPESA Message to verify payment below",
                        style: TextStyles.light(),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    //Verify pay
                    const SizedBox(
                      height: 10,
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'MPESA MESSAGE',
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Form(
                              key: _formKey,
                              child: TextFormField(
                                focusNode: myFocusNode,
                                maxLines: 2,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length < 8) {
                                    return 'Please enter your MPESA Message in the box';
                                  }
                                  if (value.length < 6 ||
                                      (value[0].contains(RegExp(r'[0-9]')) ||
                                          (!value[0]
                                              .toUpperCase()
                                              .contains(RegExp(r'[RST]'))))) {
                                    return 'Please enter a correct MPESA Message in the box';
                                  } else {
                                    setState(() {
                                      setData();
                                      verifyPay = true;
                                    });
                                  }
                                  return null;
                                },
                                controller: verifyPayController,
                                style: TextStyles.normal(22),
                                keyboardType: TextInputType.text,
                                cursorColor: Theme.of(context).primaryColor,
                                onTap: () {},
                                obscureText: false,
                                decoration: InputDecoration(
                                  focusedBorder: inputBorder,
                                  enabledBorder: inputBorder,
                                  hintText: "RGF...",
                                  hintStyle: TextStyles.normal(15)
                                      .copyWith(color: Colors.grey, height: 2),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    verifyPay == false || submitted == true
                        ? Padding(
                            padding: AppPadding.regularPadding,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: CustomButton(
                                  buttonText: 'Verify Payment',
                                  height: 60,
                                  radius: 8,
                                  color: AppColors.greyPAGEBLUE,
                                  onPressed: () {
                                    _submit();
                                    myFocusNode.unfocus();
                                    if (_formKey.currentState!.validate()) {}
                                  },
                                  width: MediaQuery.of(context).size.width),
                            ),
                          )
                        : Padding(
                            padding: AppPadding.regularPadding,
                            child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height: 200,
                                      // color: Colors.blue,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                                horizontal: 30)
                                            .copyWith(top: 10),
                                        child: Lottie.asset(
                                          repeat: false,
                                          'assets/lottie/success.json',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2.5,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Success',
                                        style: TextStyles.title(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Thank you for submitting your loan request.\nWe're reviewing your request and we'll get back to you within 48 to 72 hours",
                                        style: TextStyles.normal(),
                                      ),
                                    ),
                                  ],
                                )),
                          )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 28.0),
        child: ElevatedButton(
          onPressed: () {
            showMaterialModalBottomSheet(
              expand: false,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => SingleChildScrollView(
                child: Expanded(
                  child: Container(
                    // color: Colors.white,
                    height: MediaQuery.of(context).size.height * 1.2,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                      ),
                    ),

                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.transparent,
                                )),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close))
                          ],
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: AppPadding.regularPadding,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Please take some time to rate our application',
                              style: TextStyles.normal(
                                15,
                                Colors.grey[800],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: AppPadding.regularPadding,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomButton(
                                buttonText: 'Verify Payment',
                                height: 60,
                                radius: 8,
                                color: AppColors.greyPAGEBLUE,
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Future.delayed(
                                      Duration(
                                        seconds: 5,
                                      ), () {
                                    LaunchReview.launch(
                                        androidAppId: "com.faraja.app");
                                  });
                                  setState(() {
                                    submitted = true;
                                  });
                                },
                                width: MediaQuery.of(context).size.width),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );

            // Navigator.pop(context);
            // Navigator.pop(context);
            // Navigator.pop(context);
            // Navigator.pop(context);
            // Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5), // Rectangle shape
              ),
              backgroundColor:
                  verifyPay == true ? AppColors.greyPAGEBLUE : Colors.grey,
              foregroundColor: Colors.white, // Change the color as needed
              padding: const EdgeInsets.all(16), // Change the padding as needed
              animationDuration: Duration(milliseconds: 1000)),
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            // Make the button expand the full width
            alignment: Alignment.center,
            child: Text(
              'Submit',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

enum Availability { loading, available, unavailable }
