import 'package:flutter/material.dart';
import 'package:haba/providers/user_provider.dart';
import 'package:haba/routes/appRouter.dart';
import 'package:haba/screens/onboarding/onboarding_main.dart';
import 'package:haba/services/ads/manager/init_sdk.dart';
import 'package:haba/services/ads/manager/listenerManager.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool session = false;
  ListenerTool listener = ListenerTool();
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    loadData();
    _setSDK();
    _setListen();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      session = prefs.getBool('session') ?? false;
    });
  }

  _setSDK() {
    InitManger.setLogEnabled();
    InitManger.setExludeBundleIDArray();
    InitManger.deniedUploadDeviceInfo();
    InitManger.initTopon();

    InitManger.setChannelStr();
    InitManger.setSubchannelStr();
    InitManger.setDataConsentSet();
    InitManger.setCustomDataDic();
    InitManger.setPlacementCustomData();
    InitManger.getGDPRLevel();
    InitManger.getUserLocation();
    // InitManger.showGDPRAuth();
  }

  _setListen() {
    // InitManger.initListen();
    // listener.interListen();
    // RewarderManger.rewarderListen();
    // BannerManger.bannerListen();
    // NativeManager.nativeListen();
    listener.rewarderListen();
    listener.interListen();
    listener.bannerListen();
    listener.nativeListen();
    // ListenerManager.downLoadListen();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Faraja',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const OnboardingOverview(),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
