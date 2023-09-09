import 'package:flutter/material.dart';
import 'package:haba/screens/loans/loanapplication.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:haba/utils/paddingUtil.dart';
import 'package:haba/utils/widgets/doublesidedContainer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/appRouter.dart';

class LoanOffers extends StatefulWidget {
  const LoanOffers({super.key});

  @override
  State<LoanOffers> createState() => _LoanOffersState();
}

class _LoanOffersState extends State<LoanOffers> {
  // void incrementStep() {
  //   setState(() {
  //     if (selectedStep < 3) {
  //       selectedStep++;
  //     } else {
  //       selectedStep = 1; // reset to the first step if the end is reached
  //     }
  //   });
  // }


   

  double? interest;
  String? loanType;

  void setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('loanType', loanType!);
    prefs.setDouble('rate', interest!);
    print('SAVEDOFFERS ${loanType!} || ${interest!}');
  }

  @override
  void initState() {
    // TODO: implement initState
    // genderController.dispose();
    // firstNameController.dispose();
    // lastNameController.dispose();
    super.initState();
  }

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
            Navigator.pushNamed(context, AppRouter.dash);
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
                        'Available loan offers',
                        style: TextStyles.title(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Basen on your profile, you're elligible for the following loan offers",
                        style: TextStyles.light(),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    //Business Loan

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          setData();
                          interest = 0.05;
                          loanType = 'Business Loans';
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoaApplication(interest: interest!);
                        }));
                        Navigator.of(context)
                            .pushNamed(AppRouter.apply, arguments: interest);
                      },
                      child: DoubleContainer2(
                        child1: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xFFF1E5E9)),
                                  child: const Icon(
                                    Icons.credit_card,
                                    color: Color(0xFFED7D90),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Business Loan',
                              style: TextStyles.normal(16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 40,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xFF6362D3)),
                                  child: Center(
                                    child: Text(
                                      "Apply now",
                                      style: TextStyles.h1(10, Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        child2: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    // height: 60,
                                    // color: Colors.red,
                                    child: Column(
                                      children: [
                                        Text(
                                          "0.5 %",
                                          style:
                                              TextStyles.h1(15, Colors.black),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Interest",
                                            style: TextStyles.h1(
                                                13, Colors.indigo),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    // height: 60,
                                    // color: Colors.red,
                                    child: Column(
                                      children: [
                                        Text(
                                          "KSH 55, 000 ",
                                          style:
                                              TextStyles.h1(15, Colors.black),
                                        ),
                                        Text(
                                          "Maximum amount",
                                          style: TextStyles.h1(12, Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //  PERSONAL
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          setData();
                          interest = 0.04;
                          loanType = 'Personal Loans';
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoaApplication(interest: interest!);
                        }));
                      },
                      child: DoubleContainer2(
                        child1: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xFFF1E5E9)),
                                  child: const Icon(
                                    Icons.credit_card,
                                    color: Color(0xFFED7D90),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Personal Loan',
                              style: TextStyles.normal(16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 40,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xFF6362D3)),
                                  child: Center(
                                    child: Text(
                                      "Apply now",
                                      style: TextStyles.h1(10, Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        child2: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    // height: 60,
                                    // color: Colors.red,
                                    child: Column(
                                      children: [
                                        Text(
                                          "0.3 %",
                                          style:
                                              TextStyles.h1(15, Colors.black),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Interest",
                                            style: TextStyles.h1(
                                                13, Colors.indigo),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    // height: 60,
                                    // color: Colors.red,
                                    child: Column(
                                      children: [
                                        Text(
                                          "KSH 30, 000 ",
                                          style:
                                              TextStyles.h1(15, Colors.black),
                                        ),
                                        Text(
                                          "Maximum amount",
                                          style: TextStyles.h1(12, Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //  STUDENT
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          setData();
                          interest = 0.03;
                          loanType = 'Student Loans';
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoaApplication(interest: interest!);
                        }));
                      },
                      child: DoubleContainer2(
                        child1: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xFFF1E5E9)),
                                  child: const Icon(
                                    Icons.credit_card,
                                    color: Color(0xFFED7D90),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Student Loan',
                              style: TextStyles.normal(16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 40,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xFF6362D3)),
                                  child: Center(
                                    child: Text(
                                      "Apply now",
                                      style: TextStyles.h1(10, Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        child2: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    // height: 60,
                                    // color: Colors.red,
                                    child: Column(
                                      children: [
                                        Text(
                                          "0.3 %",
                                          style:
                                              TextStyles.h1(15, Colors.black),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Interest",
                                            style: TextStyles.h1(
                                                13, Colors.indigo),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    // height: 60,
                                    // color: Colors.red,
                                    child: Column(
                                      children: [
                                        Text(
                                          "KSH 22, 000 ",
                                          style:
                                              TextStyles.h1(15, Colors.black),
                                        ),
                                        Text(
                                          "Maximum amount",
                                          style: TextStyles.h1(12, Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // EMERGENCY:
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          setData();
                          interest = 0.05;
                          loanType = 'Emergency Loans';
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoaApplication(interest: interest!);
                        }));
                      },
                      child: DoubleContainer2(
                        child1: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xFFF1E5E9)),
                                  child: const Icon(
                                    Icons.credit_card,
                                    color: Color(0xFFED7D90),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Emergency Loan',
                              style: TextStyles.normal(16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 40,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xFF6362D3)),
                                  child: Center(
                                    child: Text(
                                      "Apply now",
                                      style: TextStyles.h1(10, Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        child2: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    // height: 60,
                                    // color: Colors.red,
                                    child: Column(
                                      children: [
                                        Text(
                                          "0.7 %",
                                          style:
                                              TextStyles.h1(15, Colors.black),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Interest",
                                            style: TextStyles.h1(
                                                13, Colors.indigo),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    // height: 60,
                                    // color: Colors.red,
                                    child: Column(
                                      children: [
                                        Text(
                                          "KSH 25, 000 ",
                                          style:
                                              TextStyles.h1(15, Colors.black),
                                        ),
                                        Text(
                                          "Maximum amount",
                                          style: TextStyles.h1(12, Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
