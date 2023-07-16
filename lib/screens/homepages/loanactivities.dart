import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:haba/utils/paddingUtil.dart';
import 'package:haba/utils/widgets/doublesidedContainer.dart';

import '../../routes/appRouter.dart';
import '../../utils/colors.dart';
import '../../utils/widgets/custom_textfield.dart';

class LoanActivities extends StatefulWidget {
  const LoanActivities({super.key});

  @override
  State<LoanActivities> createState() => _LoanActivitiesState();
}

class _LoanActivitiesState extends State<LoanActivities> {
  Future<List<ImageAndText>> readFromFirebase() async {
    await Firebase.initializeApp();
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("docId").get();

    List<ImageAndText> docsList = [];

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i].data();

      print("Docs info $a");
    }
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      docsList.add(ImageAndText(
        imageUrl: data['imageUrl'] ?? '',
        tillName: data['tillName'] ?? '',
        tillNumber: data['tillNumber'] ?? '',
      ));
    }

    return docsList;
  }

  Future<List<LoanDets>> readActivity() async {
    await Firebase.initializeApp();
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("loanActivity").get();

    List<LoanDets> docsList = [];

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i].data();

      print("Docs info $a");
    }
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      docsList.add(LoanDets(
        loanAmount: data['loanAmount'] ?? '',
        loanType: data['loanType'] ?? '',
      ));
    }

    return docsList;
  }

  @override
  void initState() {
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
                        'Loan Activity',
                        style: TextStyles.title(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "My Loan Activity",
                        style: TextStyles.light(),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //Business Loan

                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.of(context).pushNamed(AppRouter.apply);
                    //   },
                    //   child: DoubleContainer2(
                    //     child1: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.only(left: 12.0),
                    //           child: Align(
                    //             alignment: Alignment.centerLeft,
                    //             child: Container(
                    //               height: 40,
                    //               width: 40,
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(5),
                    //                   color: const Color(0xFFF1E5E9)),
                    //               child: const Icon(
                    //                 Icons.credit_card,
                    //                 color: Color(0xFFED7D90),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //         Text(
                    //           'Business Loan',
                    //           style: TextStyles.normal(16),
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.only(right: 12.0),
                    //           child: Align(
                    //             alignment: Alignment.centerLeft,
                    //             child: Container(
                    //               height: 40,
                    //               width: 90,
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(5),
                    //                   color: Color(0xFFE49C98)),
                    //               child: Center(
                    //                 child: Text(
                    //                   "Pending",
                    //                   style: TextStyles.h1(10, Colors.white),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     child2: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Column(
                    //           children: [
                    //             Align(
                    //               alignment: Alignment.centerLeft,
                    //               child: Container(
                    //                 // height: 60,
                    //                 // color: Colors.red,
                    //                 child: Column(
                    //                   children: [
                    //                     Text(
                    //                       "0.5 %",
                    //                       style:
                    //                           TextStyles.h1(15, Colors.black),
                    //                     ),
                    //                     Align(
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Text(
                    //                         "Interest",
                    //                         style: TextStyles.h1(
                    //                             13, Colors.indigo),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         Column(
                    //           children: [
                    //             Align(
                    //               alignment: Alignment.centerLeft,
                    //               child: Container(
                    //                 // height: 60,
                    //                 // color: Colors.red,
                    //                 child: Column(
                    //                   children: [
                    //                     Text(
                    //                       "KSH 55, 000 ",
                    //                       style:
                    //                           TextStyles.h1(15, Colors.black),
                    //                     ),
                    //                     Text(
                    //                       "Maximum amount",
                    //                       style: TextStyles.h1(12, Colors.grey),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),

                    // const SizedBox(
                    //   height: 10,
                    // ),

// firebase
                    FutureBuilder<List<LoanDets>>(
                      future: readActivity(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<LoanDets>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.data!.isEmpty) {
                          return Center(
                            child: Text(
                              "You have no active loan yet. \nVisit Application on homepage to Apply Now",
                              style: TextStyles.normal(
                                15,
                                Colors.grey[800],
                              ),
                            ),
                          );
                        } else {
                          return SingleChildScrollView(
                            child: Container(
                              height: 450,
                              child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  LoanDets item = snapshot.data![index];
                                  return Column(
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      // _____________________________________

                                      // test 2
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushNamed(AppRouter.apply);
                                        },
                                        child: DoubleContainer2(
                                          child1: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: const Color(
                                                            0xFFF1E5E9)),
                                                    child: const Icon(
                                                      Icons.credit_card,
                                                      color: Color(0xFFED7D90),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                item.loanType,
                                                style: TextStyles.normal(16),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 12.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(
                                                    height: 40,
                                                    width: 90,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color:
                                                            Color(0xFFE49C98)),
                                                    child: Center(
                                                      child: Text(
                                                        "Pending",
                                                        style: TextStyles.h1(
                                                            10, Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          child2: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Container(
                                                      // height: 60,
                                                      // color: Colors.red,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "0.5 %",
                                                            style:
                                                                TextStyles.h1(
                                                                    15,
                                                                    Colors
                                                                        .black),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              "Interest",
                                                              style: TextStyles.h1(
                                                                  13,
                                                                  Colors
                                                                      .indigo),
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
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Container(
                                                      // height: 60,
                                                      // color: Colors.red,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "KSH ${item.loanAmount}",
                                                            style:
                                                                TextStyles.h1(
                                                                    15,
                                                                    Colors
                                                                        .black),
                                                          ),
                                                          Text(
                                                            "Maximum amount",
                                                            style:
                                                                TextStyles.h1(
                                                                    12,
                                                                    Colors
                                                                        .grey),
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

                                      // _________________________________
                                    ],
                                  );
                                },
                              ),
                            ),
                          );
                        }
                      },
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

class ImageAndText {
  final String imageUrl;
  final String tillName;
  final String tillNumber;

  ImageAndText(
      {required this.imageUrl,
      required this.tillNumber,
      required this.tillName});
}

class LoanDets {
  final String loanAmount;
  final String loanType;

  LoanDets({
    required this.loanAmount,
    required this.loanType,
  });
}
