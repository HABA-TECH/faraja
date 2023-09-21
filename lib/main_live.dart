import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haba/root.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'flavors.dart';

void main() async {
  try {
    F.appFlavor = Flavor.live;
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId('com.faraja.android');
    OneSignal.shared
        .promptUserForPushNotificationPermission()
        .then((accepted) {});
    // await dotenv.load(fileName: ".env");
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  } catch (e) {
    print(e);
  }
  runApp(const MyApp());
}
