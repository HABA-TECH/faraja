import 'package:flutter/material.dart';
import 'package:haba/utils/colors.dart';
import 'package:haba/utils/widgets/homeContainers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/TextStyles.dart';
import '../../utils/widgets/headerContainer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    late String phoneNum = 'abc';
  late String email = '';
  late String lastName = '';
  late String firstName = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      phoneNum = prefs.getString('phone') ?? '0711';
      email = prefs.getString('email') ?? 'test@gmail.com';
      lastName = prefs.getString('lastName') ?? 'Kamau';
      firstName = prefs.getString('firstName') ?? 'John';
      // prefs.setString('lastName', lastName);
      // prefs.setString('email', email);
      // prefs.setString('phone', phone);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.greyPAGEBLUE,
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
              HeaderContainer(
                name: firstName,
                height: MediaQuery.of(context).size.height * .30,
              ),

              const SizedBox(
                height: 20,
              ),

              // Quick Links
              Container(
                // color: Colors.red,
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width * .9,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Quick Links',
                          style: TextStyles.h1(22, Colors.grey[700]),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // HomeContainers
                      const HomeContainers()
                    ],
                  ),
                ),
              )
              // Padding(
              //     padding: const EdgeInsets.only(left: 17),
              //     child:
            ],
          ),
        ),
      ),
    );
  }
}
