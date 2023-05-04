
import 'package:flutter/material.dart';
import 'package:haba/providers/user_provider.dart';
import 'package:haba/screens/my_home_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        // SomeOtherProvider(), // Assuming SomeOtherProvider doesn't extend ChangeNotifier
      ],
      child: MaterialApp(
        title: 'Your App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}