import 'package:flutter/material.dart';
import 'package:haba/utils/colors.dart';

import '../../utils/widgets/headerContainer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: () {
                  // open notifications
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              )
            ],
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            })),
        drawer: Drawer(
            child: ListView(
          children: const [
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text('Activities'),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Loans'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
            ),
          ],
        )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Header Container
              // Drawer(),
              HeaderContainer(
                name: 'Joshua',
                height: MediaQuery.of(context).size.height * .30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
