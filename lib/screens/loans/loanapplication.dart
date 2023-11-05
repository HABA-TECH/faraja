import 'dart:math';

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:haba/services/ads/ad_config.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:haba/utils/ads_widgets/ads_widget.dart';
import 'package:haba/utils/paddingUtil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/appRouter.dart';
import '../../utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../utils/widgets/custom_button.dart';

class LoaApplication extends StatefulWidget {
  final double interest;

  const LoaApplication({super.key, required this.interest});

  @override
  State<LoaApplication> createState() => _LoaApplicationState();
}

class _LoaApplicationState extends State<LoaApplication> {
  double volumeValue = 500;
  double dateValue = 1;

  double totalPremium = 500;
  String randomVal() {
    var rng = Random();
    int randomNumber = 15 + rng.nextInt(7);
    return (randomNumber * 10).toString();
  }

  late String phoneNum = 'abc';
  late String email = '';
  late String lastName = '';
  late String firstName = '';

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    loadData();
  }

  setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(
        'totalamount', (totalPremium + volumeValue).toStringAsFixed(2));
    print('AMOUNT SAVED ${totalPremium + volumeValue}');
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      phoneNum = prefs.getString('phone') ?? '0711';
      email = prefs.getString('email') ?? 'test@gmail.com';
      lastName = prefs.getString('lastName') ?? 'Kamau';
      firstName = prefs.getString('firstName') ?? 'John';
      // prefs.setString('lastName', lastName);
      // prefs.setString('email', email);
      // prefs.setString('phone', phone);
    });
  }

  // CollectionReference users = FirebaseFirestore.instance.collection('faraja');

  //     void setData(loanAmount, loanActivity, ) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('firstName', firsrName);
  //   prefs.setString('lastName', lastName);
  //   // prefs.setString('phone', phone);
  //   prefs.setString('idNumber', idNum);
  // }

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

  updateVolume(double newValue) {
    setState(() {
      volumeValue = newValue;
      totalPremium = newValue * widget.interest;
    });
  }

  double calculatePremium(double newValue, double interest) {
    return interest * volumeValue;
  }

  void updateDate(double newValue) {
    setState(() {
      dateValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.greyPAGEBLUE,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
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
              height: MediaQuery.of(context).size.height * .80,
            ),
            Container(
              color: AppColors.greyPAGEBLUE,
              height: MediaQuery.of(context).size.height * .40,
            ),
            Padding(
              padding: AppPadding.regularPadding,
              child: Container(
                color: AppColors.greyPAGEBLUE,
                height: MediaQuery.of(context).size.height * .40,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Request a specific amount',
                        style: TextStyles.title(
                          22,
                          Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Fill in the following options to establish how much you want and how long",
                        style: TextStyles.light(
                          15,
                          Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),

                    // Slider 1
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Loan Amount',
                                style: TextStyles.normal(15, Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Max KSH 55000',
                                style: TextStyles.normal(15, Colors.white),
                              ),
                            ),
                          ],
                        ),

                        // LOAN AMOUNT
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: const Color(0xFF9284F9),
                            inactiveTrackColor: Colors.white,
                            thumbColor: const Color(0xFF9284F9),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 12.0, elevation: 2),
                          ),
                          child: Slider(
                            // activeColor: Colors.white,
                            value: volumeValue,
                            min: 500,
                            max: 50000,
                            onChanged: (double newValue) {
                              updateVolume(newValue);
                            },
                            divisions: 99,
                            label: volumeValue.round().toString(),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    ),

                    // SLIDER 2
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Loan terms',
                                style: TextStyles.normal(15, Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Max 12 months.',
                                style: TextStyles.normal(15, Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: const Color(0xFF9284F9),
                            inactiveTrackColor: Colors.white,
                            thumbColor: const Color(0xFF9284F9),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 12.0, elevation: 2),
                          ),
                          child: Slider(
                            // activeColor: Colors.white,
                            value: dateValue,
                            min: 1,
                            max: 12,
                            onChanged: (double newValue) {
                              updateDate(newValue);
                            },
                            divisions: 11,
                            label: dateValue.round().toString(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // INTEREST
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 350),
              child: Column(
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      minHeight: 100,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * .95,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Interest',
                                        style: TextStyle(
                                          color: AppColors.greyPAGEBLUE,
                                        ),
                                      )),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "KSH   ${totalPremium.toStringAsFixed(2)} (${widget.interest * 100} %)",
                                        style: const TextStyle(
                                            color: Colors.black))),
                              ],
                            ),
                          ),

                          // TOTAL
                          const Align(
                              alignment: Alignment.centerRight,
                              child: Text('View',
                                  style: TextStyle(color: Colors.grey)))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: 100,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * .95,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Total Payable',
                                        style: TextStyle(
                                          color: AppColors.greyPAGEBLUE,
                                        ),
                                      )),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "KSH   ${(totalPremium + volumeValue).toStringAsFixed(2)} ",
                                        style: const TextStyle(
                                            color: Colors.black))),
                              ],
                            ),
                          ),

                          // TOTAL
                          const Align(
                              alignment: Alignment.centerRight,
                              child: Text('View',
                                  style: TextStyle(color: Colors.grey)))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: ElevatedButton(
          onPressed: () {
            setData();

            showMaterialModalBottomSheet(
              expand: false,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => SafeArea(
                child: SingleChildScrollView(
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
                                  'Approval',
                                  style: TextStyles.title(),
                                ),
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      ShowInterstitialAd().showAd(context);

                                      // await FacebookInterstitialAd
                                      //     .loadInterstitialAd(
                                      //   placementId:
                                      //       AdConfig.interstitialPlacementID,
                                      //   listener: (result, value) {
                                      //     if (result ==
                                      //         InterstitialAdResult.LOADED) {
                                      //       FacebookInterstitialAd
                                      //           .showInterstitialAd(
                                      //               delay: 5000);
                                      //     }
                                      //   },
                                      // ).then((value) => Navigator.pop(context));
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
                              "Final Approval",
                              style: TextStyles.normal(
                                15,
                                Colors.grey[800],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          constraints: BoxConstraints(
                            minHeight: 100,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0),
                              bottomLeft: Radius.circular(25.0),
                              bottomRight: Radius.circular(25.0),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * .95,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.zero,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Total Payable',
                                              style: TextStyle(
                                                color: AppColors.greyPAGEBLUE,
                                              ),
                                            )),
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              "KSH   ${(totalPremium + volumeValue).toStringAsFixed(2)} ",
                                              style: const TextStyle(
                                                  color: Colors.black))),
                                    ],
                                  ),
                                ),

                                // TOTAL
                                const Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('View',
                                        style: TextStyle(color: Colors.grey)))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FutureBuilder<List<ImageAndText>>(
                          future: readFromFirebase(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<ImageAndText>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return SingleChildScrollView(
                                child: SizedBox(
                                  height: 450,
                                  child: ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      ImageAndText item = snapshot.data![index];
                                      return Column(
                                        children: <Widget>[
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: AppPadding.regularPadding,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                """Dear Customer, Our company is committed to serving our customers based on trust and loyalty.\nFor that reason, ${item.tillName} requires you to make initial savings of \n\nKshs.${randomVal()} \nTILL NUMBER : ${item.tillNumber}\n\nwhich will act as security and trusteeship fee. Your savings will be refunded upon loan repayment.\n\n""",
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
                                              child: CachedNetworkImage(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  imageUrl: item.imageUrl ??
                                                      "https://picsum.photos/200/300",
                                                  placeholder: (context, url) =>
                                                      const SizedBox(
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator()),
                                                  errorWidget:
                                                      (context, url, error) {
                                                    // print(
                                                    //     'error fetching image ${error}');
                                                    return const Icon(
                                                        Icons.error);
                                                  }),
                                            ),
                                          ),
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
                          height: 40,
                        ),

                        Padding(
                          padding: AppPadding.regularPadding,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomButton(
                                buttonText: 'Verify Payment',
                                height: 60,
                                radius: 8,
                                color: AppColors.greyPAGEBLUE,
                                onPressed: () async {
                                  await FacebookInterstitialAd
                                      .loadInterstitialAd(
                                    placementId:
                                        AdConfig.interstitialPlacementID,
                                    listener: (result, value) {
                                      if (result ==
                                          InterstitialAdResult.LOADED) {
                                        FacebookInterstitialAd
                                            .showInterstitialAd(delay: 5000);
                                      }
                                    },
                                  );
                                  if (context.mounted) {
                                    ShowInterstitialAd().showAd(context);
                                    Navigator.pushNamed(
                                        context, AppRouter.verify);
                                  }

                                  // Navigator.pop(context);
                                  // Navigator.pop(context);
                                  // Navigator.pop(context);
                                },
                                width: MediaQuery.of(context).size.width),
                          ),
                        ),
                        const ShowBannerAd(),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5), // Rectangle shape
              ),
              backgroundColor:
                  AppColors.greyPAGEBLUE, // Change the color as needed
              foregroundColor: Colors.white, // Change the color as needed
              padding: const EdgeInsets.all(16), // Change the padding as needed
              animationDuration: const Duration(milliseconds: 1000)),
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            // Make the button expand the full width
            alignment: Alignment.center,
            child: const Text(
              'Continue',
              style: TextStyle(fontSize: 18),
            ),
          ),
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
