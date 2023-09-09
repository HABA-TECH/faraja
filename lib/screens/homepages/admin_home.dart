import 'package:flutter/material.dart';
import 'package:haba/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/appRouter.dart';
import '../../utils/TextStyles.dart';
import '../../utils/widgets/adminHomeContainers.dart';
import '../../utils/widgets/headerContainer.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
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
        drawer: Drawer(
            child: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.login);
              },
              leading: const Icon(Icons.person),
              title: const Text('Log Out'),
            ),
          ],
        )),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Header Container
              AdminHeaderContainer(
                name: firstName,
                height: MediaQuery.of(context).size.height * .20,
              ),

              const SizedBox(
                height: 20,
              ),

              // Quick Links
              SingleChildScrollView(
                child: SizedBox(
                  // color: Colors.red,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * .9,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sections',
                            style: TextStyles.h1(22, Colors.grey[700]),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // HomeContainers
                        const AdminHomeContainers()
                      ],
                    ),
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
