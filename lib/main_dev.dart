import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:haba/root.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'flavors.dart';

void main() async {
  
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  F.appFlavor = Flavor.dev;
  
  await dotenv.load(fileName: ".env");
  runApp( MyApp());
}
