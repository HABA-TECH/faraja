import 'package:flutter/material.dart';
import 'package:haba/models/user.dart';
import 'package:provider/provider.dart';
import '../flavors.dart';
import '../providers/user_provider.dart';
import '../repository/auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {

    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }
 
  @override
  Widget build(BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        title:  Text('Haba ${F.name}',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${user?.name ?? 'Guest'}!'),
            ElevatedButton(
              onPressed: () {
                final newUser = User(name: 'John Doe', age: 25);
                userProvider.setUser(newUser);
              },
              child: const Text('Set User'),
            ),
          ],
        ),
      ),
    );
  }
}
