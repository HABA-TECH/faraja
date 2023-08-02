import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:haba/root.dart';
import 'flavors.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId('com.faraja.app');
  await OneSignal.shared.consentGranted(true);
  OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((accepted) {});
  runApp(MyApp());
  F.appFlavor = Flavor.dev;

  // await dotenv.load(fileName: ".env");
  runApp(MyApp());
}
