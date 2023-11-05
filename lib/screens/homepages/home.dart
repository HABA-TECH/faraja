import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:haba/services/ads/ad_config.dart';
import 'package:haba/utils/ads_widgets/ads_widget.dart';
import 'package:haba/utils/colors.dart';
import 'package:haba/utils/widgets/homeContainers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/appRouter.dart';
import '../../utils/TextStyles.dart';
import '../../utils/widgets/headerContainer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String phoneNum = 'abc';
  late String email = '';
  late String lastName = '';
  late String firstName = '';
  String FB_INTERSTITIAL_AD_ID = "996101281548472_996123001546300";
  bool isInterstitialAdLoaded = false;
  @override
  void initState() {
    super.initState();
    // _loadInterstitialAd();
    loadData();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      phoneNum = prefs.getString('phone') ?? '0711';
      email = prefs.getString('email') ?? 'test@gmail.com';
      lastName = prefs.getString('lastName') ?? 'Kamau';
      firstName = prefs.getString('firstName') ?? 'John';
 
    });
  }

  // void _loadInterstitialAd() {
  //   FacebookInterstitialAd.loadInterstitialAd(
  //       placementId: FB_INTERSTITIAL_AD_ID,
  //       listener: (result, value) {
  //         if (result == InterstitialAdResult.LOADED) {
  //           isInterstitialAdLoaded = true;
  //         }

  //         if (result == InterstitialAdResult.DISMISSED &&
  //             value["invalidated"] == true) {
  //           isInterstitialAdLoaded = false;
  //           _loadInterstitialAd();
  //         }
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.greyPAGEBLUE,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {
                // FacebookNativeAd(
                //   placementId: "996101281548472_996122818212985",
                //   adType: NativeAdType.NATIVE_BANNER_AD,
                //   bannerAdSize: NativeBannerAdSize.HEIGHT_100,
                //   width: double.infinity,
                //   backgroundColor: Colors.blue,
                //   titleColor: Colors.white,
                //   descriptionColor: Colors.white,
                //   buttonColor: Colors.deepPurple,
                //   buttonTitleColor: Colors.white,
                //   buttonBorderColor: Colors.white,
                //   listener: (result, value) {
                //     print("Native Ad: $result --> $value");
                //   },
                // );
                // _loadInterstitialAd();
                // open notifications
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            )
          ],
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          })),
      drawer: Drawer(
          child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.analytics),
            title: const Text('Activities'),
            onTap: () {
              // Navigator.pushNamed(context, AppRouter.);
            },
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('Loans'),
            onTap: () {
              Navigator.pushNamed(context, AppRouter.loanOffers);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // Navigator.pushNamed(context, AppRouter.pro);
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.register);
            },
            leading: const Icon(Icons.person),
            title: const Text('Log Out'),
          ),
        ],
      )),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Header Container
                HeaderContainer(
                  name: firstName,
                  height: MediaQuery.of(context).size.height * .30,
                ),

                const SizedBox(
                  height: 20,
                ),

                // Quick Links
                SizedBox(
                  // color: Colors.red,
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width * .9,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Quick Links',
                            style: TextStyles.h1(22, Colors.grey[700]),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // HomeContainers
                        const HomeContainers()
                      ],
                    ),
                  ),
                )
                // Padding(
                //     padding: const EdgeInsets.only(left: 17),
                //     child:
              ],
            ),
          ),
          // show banner ad

          const ShowBannerAd()
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: FacebookBannerAd(
          //     placementId: AdConfig.bannerPlacementID,
          //     bannerSize: BannerSize.STANDARD,
          //     listener: (result, value) {
          //       switch (result) {
          //         case BannerAdResult.ERROR:
          //           print("Error: $value");
          //           break;
          //         case BannerAdResult.LOADED:
          //           print("Loaded: $value");
          //           break;
          //         case BannerAdResult.CLICKED:
          //           print("Clicked: $value");
          //           break;
          //         case BannerAdResult.LOGGING_IMPRESSION:
          //           print("Logging Impression: $value");
          //           break;
          //       }
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
