import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:haba/utils/paddingUtil.dart';
import 'package:haba/utils/widgets/profileContainer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/appRouter.dart';
import '../../utils/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
    String firstNameInitial = firstName.substring(0, 1);
    String lastNameInitial = lastName.substring(0, 1);

    String initials = "$firstNameInitial$lastNameInitial";
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.grey[200],
              height: MediaQuery.of(context).size.height,
            ),
            Padding(
              padding: AppPadding.regularPadding,
              child: Container(
                color: Colors.grey[200],
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Profile',
                        style: TextStyles.title(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: CircularProfileAvatar(
                          'https://firebasestorage.googleapis.com/v0/b/faraja-5e953.appspot.com/o/avatar.png?alt=media&token=2f710331-38fd-4d48-b4f5-21b7b7592c30', //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                          radius: 60, // sets radius, default 50.0
                          backgroundColor: Colors
                              .transparent, // sets background color, default Colors.white
                          borderWidth: 5, // sets border, default 0.0
                          initialsText: Text(
                            initials,
                            style: const TextStyle(fontSize: 40, color: Colors.white),
                          ), // sets initials text, set your own style, default Text('')
                          borderColor: AppColors
                              .greyPAGEBLUE!, // sets border color, default Colors.white
                          elevation:
                              5.0, // sets elevation (shadow of the profile picture), default value is 0.0
                          foregroundColor: Colors.black.withOpacity(
                              0.1), //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
                          cacheImage:
                              true, // allow widget to cache image against provided url
                          imageFit: BoxFit.cover,
                          onTap: () {}, // sets on tap
                          showInitialTextAbovePicture:
                              true, // setting it true will show initials text above profile picture, default false
                        )),

                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        firstName,
                        style: TextStyles.title(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '',
                        style: TextStyles.normal(15, Colors.grey),
                      ),
                    ),

                    const SizedBox(
                      height: 45,
                    ),
                    //Profile
                    ProfileContainer(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRouter.loanOffers);
                        },
                        buttonText: 'Credit Limit',
                        icon: Icon(Icons.check_box_outlined,
                            color: Colors.grey[800])),
                    const SizedBox(
                      height: 10,
                    ),
                    ProfileContainer(
                        onPressed: () {},
                        buttonText: 'Invite Friends',
                        icon: Icon(Icons.people, color: Colors.grey[800])),
                    const SizedBox(
                      height: 10,
                    ),
                    ProfileContainer(
                        onPressed: () {},
                        buttonText: 'Account Security',
                        icon: Icon(Icons.lock, color: Colors.grey[800])),
                    const SizedBox(
                      height: 10,
                    ),
                    ProfileContainer(
                        onPressed: () {},
                        buttonText: 'Help and Feedback',
                        icon:
                            Icon(Icons.message_sharp, color: Colors.grey[800])),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
