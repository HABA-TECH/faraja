import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:haba/models/user.dart';
import 'package:haba/screens/homepages/activity.dart';
import 'package:haba/screens/homepages/home.dart';
import 'package:haba/screens/homepages/loans.dart';
import 'package:haba/screens/homepages/profile.dart';
import 'package:haba/utils/colors.dart';
import 'package:provider/provider.dart';
import '../flavors.dart';
import '../providers/user_provider.dart';
import '../repository/auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // appBar: AppBar(
      //   title: Text("Faraja Credit")),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[Home(), Activities(), Loans(), Profile()],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: '',
      //   child: Icon(Icons.add),
      // ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        showElevation: false,
        containerHeight: 80,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.home_filled),
            title: const Text('Home'),
            activeColor: AppColors.greyPAGEBLUE!,
            inactiveColor: Colors.grey[500],
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.analytics),
            title: const Text('Activities'),
            activeColor: AppColors.greyPAGEBLUE!,
            inactiveColor: Colors.grey[700],
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.credit_card_rounded),
            title: const Text(
              'Loans',
            ),
            activeColor: AppColors.greyPAGEBLUE!,
            textAlign: TextAlign.center,
            inactiveColor: Colors.grey[700],
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Profile'),
            activeColor: AppColors.greyPAGEBLUE!,
            inactiveColor: Colors.grey[700],
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
