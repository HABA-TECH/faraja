import 'package:flutter/material.dart';
import 'package:haba/root.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'flavors.dart';

void main() async {
  F.appFlavor = Flavor.live;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId('com.faraja.app');
  OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((accepted) {});
  // await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}
