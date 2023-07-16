import 'package:flutter/material.dart';
import 'package:haba/routes/approuter.dart';
import 'package:haba/utils/colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../TextStyles.dart';
import '../paddingUtil.dart';

class HomeContainers extends StatelessWidget {
  const HomeContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.personalInfoHome);
              },
              child: CustomHomeContainer(
                  height: 120,
                  icon: Icons.money,
                  text: 'Apply for a loan',
                  color: AppColors.greyPAGEBLUE),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.loanOffers);
              },
              child: CustomHomeContainer(
                height: 160,
                icon: Icons.pie_chart,
                text: 'Loan offers',
                color: AppColors.greyPINK,
              ),
            ),
          ],
        ),
        Column(
          children: [
            CustomHomeContainer(
                height: 160,
                icon: Icons.wallet,
                text: 'Make loan repayment',
                color: AppColors.greyLIGHTGREEN),
            GestureDetector(
              onTap: () {
                showMaterialModalBottomSheet(
                  expand: false,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => SingleChildScrollView(
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
                          // top section
                          Padding(
                            padding: AppPadding.regularPadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Terms and Conditions',
                                    style: TextStyles.title(),
                                  ),
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.close_sharp),
                                    ),
                                    const Text('Close'),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          Padding(
                            padding: AppPadding.regularPadding,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Please accept our terms and conditions",
                                style: TextStyles.normal(
                                  15,
                                  Colors.grey[800],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: AppPadding.regularPadding,
                            child: Align(
                              alignment: Alignment.centerLeft,
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
                                style: TextStyles.normal(
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
              child: CustomHomeContainer(
                  height: 120,
                  icon: Icons.add_circle_outline_outlined,
                  text: 'Terms and Conditions',
                  color: AppColors.greyCYAN),
            ),
          ],
        )
      ],
    );
  }
}

class CustomHomeContainer extends StatelessWidget {
  final double? height;
  final Color? color;
  final String? text;
  final IconData? icon;
  const CustomHomeContainer({
    super.key,
    required this.height,
    required this.color,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Container(
        width: MediaQuery.of(context).size.width * .445,
        height: height,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 25,
            right: 5,
          ),
          child: Center(
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 30),
                    child: Container(
                        child: Text(text!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14))),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
