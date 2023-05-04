import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:haba/root.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'flavors.dart';

void main() async {
  F.appFlavor = Flavor.live;
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}
