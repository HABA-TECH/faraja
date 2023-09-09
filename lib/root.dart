import 'package:flutter/material.dart';
import 'package:haba/providers/user_provider.dart';
import 'package:haba/routes/appRouter.dart';
import 'package:haba/screens/onboarding/onboarding_main.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool session = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      session = prefs.getBool('session') ?? false;
    });
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
