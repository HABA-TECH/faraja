import 'package:flutter/material.dart';
import 'package:haba/models/user.dart';
import 'package:provider/provider.dart';
import '../flavors.dart';
import '../providers/user_provider.dart';
import '../repository/auth.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        title:  Text('Haba ${F.name}'),
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
