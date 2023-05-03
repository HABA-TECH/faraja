import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:haba/pages/my_home_page.dart';
import 'flavors.dart';

void main() async {
  F.appFlavor = Flavor.live;
  await dotenv.load(fileName: ".env");
  runApp(const MyHomePage());
}
