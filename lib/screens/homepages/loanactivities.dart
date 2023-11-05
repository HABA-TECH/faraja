import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:haba/services/ads/ad_config.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:haba/utils/ads_widgets/ads_widget.dart';
import 'package:haba/utils/paddingUtil.dart';
import 'package:haba/utils/widgets/doublesidedContainer.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import '../../routes/appRouter.dart';

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

  double? interest;
  String? loanType;
  String? loanAmount;
  bool? verifyPay = false;
  bool? hasCounted;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future setCounterMemory(counter) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('counter', counter);
  }

  Future<Widget> timeoutFunction() async {
    Completer<Widget> completer = Completer<Widget>();
    Logger().i('Stared Activity Timer');
    setCounterMemory(true);

    // Create a Timer that will complete the Future after 45 seconds

    Timer(Duration(hours: 20), () {
      completer.complete(
        Container(),
      );
      clearActivity();
    });

    // You can add additional logic here if needed

    return completer.future;
  }

  void getCounterMemory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      hasCounted = prefs.getBool('counter');
    });
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      interest = prefs.getDouble('rate') ?? 0.0;
      verifyPay = prefs.getBool('verified') ?? false;
      loanType = prefs.getString('loanType') ?? '';
      loanAmount = prefs.getString('totalamount') ?? '';

      // prefs.setString('lastName', lastName);
      // prefs.setString('email', email);
      // prefs.setString('phone', phone);
    });
  }

  dynamic clearActivity() async {
    print('Activity cleared');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove('rate');
      prefs.remove('verified');
      prefs.remove('loanType');
      prefs.remove('totalamount');

      // prefs.setString('lastName', lastName);
      // prefs.setString('email', email);
      // prefs.setString('phone', phone);
    });
  }

  Widget fuBuilder() {
    return Center(
      child: FutureBuilder<Widget>(
        future: timeoutFunction(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return activityWidget(); // Display a loading indicator while waiting
          } else if (snapshot.hasError) {
            return Text("An error occurred: ${snapshot.error}");
          } else {
            return snapshot.data ??
                Text("Function did not time out within 45 seconds.",
                    style: TextStyle(fontSize: 20));
          }
        },
      ),
    );
  }

  activityWidget() {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),

        // _____________________________________

        // test 2
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRouter.apply);
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
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Text(
                  loanType!,
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
                          color: Colors.green),
                      child: Center(
                        child: Text(
                          "Pending",
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
                              "$interest",
                              style: TextStyles.h1(15, Colors.black),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Interest",
                                style: TextStyles.h1(13, Colors.indigo),
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
                              "KSH ${loanAmount!}",
                              style: TextStyles.h1(15, Colors.black),
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

        // _________________________________
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[200],
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {
        //     ShowInterstitialAd().showAd(context);
        //   },
        // ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                        verifyPay == false
                            ? Center(
                                child: Text(
                                  "You have no active loan yet. \nVisit Application on homepage to Apply Now",
                                  style: TextStyles.normal(
                                    15,
                                    Colors.grey[800],
                                  ),
                                ),
                              )
                            : fuBuilder(),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: FacebookBannerAd(
              placementId: AdConfig.bannerPlacementID,
              bannerSize: BannerSize.STANDARD,
              listener: (result, value) {
                switch (result) {
                  case BannerAdResult.ERROR:
                    print("Error: $value");
                    break;
                  case BannerAdResult.LOADED:
                    print("Loaded: $value");
                    break;
                  case BannerAdResult.CLICKED:
                    print("Clicked: $value");
                    break;
                  case BannerAdResult.LOGGING_IMPRESSION:
                    print("Logging Impression: $value");
                    break;
                }
              },
            ),
          )
        ],
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
