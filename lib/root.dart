import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haba/providers/user_provider.dart';
import 'package:haba/routes/approuter.dart';
import 'package:haba/screens/onboarding/onboarding_main.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        // SomeOtherProvider(), // Assuming SomeOtherProvider doesn't extend ChangeNotifier
      ],
      child: MaterialApp(
        title: 'Your App',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const OnboardingOverview(),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}