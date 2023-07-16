import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:haba/utils/paddingUtil.dart';
import 'package:haba/utils/widgets/doublesidedContainer.dart';
import 'package:haba/utils/widgets/profileContainer.dart';

import '../../routes/appRouter.dart';
import '../../utils/colors.dart';
import '../../utils/widgets/custom_textfield.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // void incrementStep() {
  //   setState(() {
  //     if (selectedStep < 3) {
  //       selectedStep++;
  //     } else {
  //       selectedStep = 1; // reset to the first step if the end is reached
  //     }
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    // genderController.dispose();
    // firstNameController.dispose();
    // lastNameController.dispose();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                          'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4', //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                          radius: 60, // sets radius, default 50.0
                          backgroundColor: Colors
                              .transparent, // sets background color, default Colors.white
                          borderWidth: 5, // sets border, default 0.0
                          // initialsText: const Text(
                          //   "AD",
                          //   style: TextStyle(fontSize: 40, color: Colors.white),
                          // ), // sets initials text, set your own style, default Text('')
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
                        'Joshua Patrick',
                        style: TextStyles.title(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Teacher',
                        style: TextStyles.normal(15, Colors.grey),
                      ),
                    ),

                    const SizedBox(
                      height: 45,
                    ),
                    //Profile
                    ProfileContainer(
                        onPressed: () {},
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
