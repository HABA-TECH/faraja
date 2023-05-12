import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:haba/root.dart';
import 'flavors.dart';

void main() async {
  
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  F.appFlavor = Flavor.dev;
  
  await dotenv.load(fileName: ".env");
  runApp( MyApp());
}
