import 'package:flutter/material.dart';
import 'package:haba/routes/appRouter.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:haba/utils/paddingUtil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../utils/widgets/custom_textfield.dart';

class PersonalInfoHome extends StatefulWidget {
  const PersonalInfoHome({super.key});

  @override
  State<PersonalInfoHome> createState() => _PersonalInfoHomeState();
}

class _PersonalInfoHomeState extends State<PersonalInfoHome> {
  int _currentStep = 0;
  int? stepsNumberButton;
  int stepsNumber = 0;
  String? chosenValue;
  String? genderedValue;
  bool? isFilled = false;
  String? maritalStatusValue;

  DateTime? _selectedDate;
  String? formattedDate;

  final employmentController = TextEditingController();
  final educationController = TextEditingController();
  final genderController = TextEditingController();
  final professionController = TextEditingController();
  final incomeController = TextEditingController();
  final contactNameController = TextEditingController();

  // void incrementStep() {
  //   setState(() {
  //     if (selectedStep < 3) {
  //       selectedStep++;
  //     } else {
  //       selectedStep = 1; // reset to the first step if the end is reached
  //     }
  //   });
  // }
  Widget _circleStep(String text, stepsNumber, headerText) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentStep = stepsNumber;
        });
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: _currentStep == stepsNumber
                  ? AppColors.greyPAGEBLUE
                  : Colors.grey[200],
              border: Border.all(color: AppColors.greyPAGEBLUE!, width: 2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: _currentStep == stepsNumber
                      ? Colors.grey[200]
                      : Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Text(
            headerText,
            style: TextStyle(
              color: _currentStep == stepsNumber ? Colors.black : Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  @override
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

  Widget buildDropDownMaleFemale() {
    return Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColors.greyPAGEBLUE!,
            )),
        child: Center(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: genderedValue,
                  elevation: 0,

                  // Underline color
                  // underline: Container(
                  //   height: 2,
                  //   color: Colors.deepPurpleAccent,
                  // ),
                  // Items in dropdown
                  items: <String>[
                    'Male',
                    'Female',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: const Text(
                    'Select Gender',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      isFilled = true;
                      genderedValue = value;
                    });
                  },
                ),
              ),
            ),
          ),
        ));
  }

  bool loopDone = false;
  int loopValue = 0;
  loopFromZeroToTwo() {
    int val;
    for (val = 0; val <= 2; val++) {
      print('Loop Value: $val');
    }
    setState(() {
      loopDone = true;
      loopValue = val;
    });
    print('Done: $loopDone');
  }

  Widget buildDropDownMaritalStatus() {
    return Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColors.greyPAGEBLUE!,
            )),
        child: Center(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: maritalStatusValue,
                  elevation: 0,

                  // Underline color
                  // underline: Container(
                  //   height: 2,
                  //   color: Colors.deepPurpleAccent,
                  // ),
                  // Items in dropdown
                  items: <String>[
                    'Single',
                    'Married',
                    'Divorced',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: const Text(
                    'Select Marital Status',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      isFilled == true;
                      maritalStatusValue = value;
                    });
                  },
                ),
              ),
            ),
          ),
        ));
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    DateTime initialDate =
        DateTime(DateTime.now().year - 18); // Set initialDate to 18 years ago
    DateTime firstDate = DateTime(DateTime.now().year -
        60); // The earliest selectable date is 60 years ago
    DateTime lastDate = DateTime(
        DateTime.now().year - 18); // The latest selectable date is 18 years ago

    // Check if initialDate is after lastDate
    if (initialDate.isAfter(lastDate)) {
      initialDate = lastDate; // If it is, set initialDate to lastDate
    }
    // ignore: no_leading_underscores_for_local_identifiers

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
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
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Personal information',
                        style: TextStyles.title(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please fill in the following information',
                        style: TextStyles.light(),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // stepper
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _circleStep('1', stepsNumber = 0, 'Basic'),
                            _circleStep('2', stepsNumber = 1, 'Personal'),
                            _circleStep('3', stepsNumber = 2, 'Referee'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        if (_currentStep == 0)

                          // BASIC
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child:

                                // Form Fields
                                Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomTextField(
                                      text: 'First Name',
                                      hintText: firstName,
                                      color: AppColors.greyPAGEBLUE,
                                      controller: educationController,
                                      inputType: TextInputType.text,
                                      obscureText: false,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomTextField(
                                      text: 'Last Name',
                                      hintText: lastName,
                                      color: AppColors.greyPAGEBLUE,
                                      controller: employmentController,
                                      inputType: TextInputType.text,
                                      obscureText: false,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: GestureDetector(
                                        onTap: () async {
                                          final DateTime? picked =
                                              await showDatePicker(
                                            context: context,

                                            initialDate: initialDate,
                                            firstDate: firstDate,
                                            lastDate:
                                                lastDate, // The latest selectable date is 18 years ago
                                          );

                                          if (picked != null &&
                                              picked != _selectedDate) {
                                            setState(() {
                                              formattedDate =
                                                  convertDateTimeDisplay(
                                                      picked.toString());

                                              print(
                                                  'FORMATTEDdATE $formattedDate');

                                              _selectedDate = picked;
                                            });
                                          } else {
                                            _selectedDate = DateTime.now();
                                          }
                                        },
                                        child: Container(
                                          height: 70,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                color: AppColors.greyPAGEBLUE!,
                                              )),
                                          child: Center(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(_selectedDate !=
                                                        null
                                                    ? 'Date of birth: $formattedDate'
                                                    : 'Select Date of Birth'),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: buildDropDownMaleFemale()),
                              ],
                            ),
                          ),

                        if (_currentStep == 1)
                          // PERSONAL

                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child:

                                // Form Fields
                                Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomTextField(
                                      text: 'Education',
                                      hintText:
                                          "Please type your highest level of education e.g University",
                                      color: AppColors.greyPAGEBLUE,
                                      controller: educationController,
                                      inputType: TextInputType.text,
                                      obscureText: false,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomTextField(
                                      text: 'Employment',
                                      hintText:
                                          "e.g Employed / Self Employment",
                                      color: AppColors.greyPAGEBLUE,
                                      controller: employmentController,
                                      inputType: TextInputType.text,
                                      obscureText: false,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomTextField(
                                      text: 'Profession',
                                      hintText: "Type your profession",
                                      controller: professionController,
                                      inputType: TextInputType.text,
                                      obscureText: false,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomTextField(
                                      text: 'Monthly Income',
                                      hintText: "Ksh ..",
                                      controller: incomeController,
                                      inputType: TextInputType.number,
                                      obscureText: false,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: buildDropDownMaritalStatus()),
                              ],
                            ),
                          ),
                        if (_currentStep == 2)
                          Column(
                            children: [
                              Container(
                                  height: 70,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: AppColors.greyPAGEBLUE!,
                                      )),
                                  child: Center(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            value: chosenValue,
                                            elevation: 0,

                                            // Underline color
                                            // underline: Container(
                                            //   height: 2,
                                            //   color: Colors.deepPurpleAccent,
                                            // ),
                                            // Items in dropdown
                                            items: <String>[
                                              'Select the relationship',
                                              'Parent',
                                              'Sibling',
                                              'Friend'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            hint: const Text(
                                              "Select the relationship with your referee",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            onChanged: (String? value) {
                                              setState(() {
                                                isFilled == false;
                                                chosenValue = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: CustomTextField(
                                    text: 'Contact Name',
                                    hintText: "e.g Jane",
                                    color: AppColors.greyPAGEBLUE,
                                    controller: contactNameController,
                                    inputType: TextInputType.text,
                                    obscureText: false,
                                  ),
                                ),
                              ),
                            ],
                          )
                        // Contact
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: ElevatedButton(
          onPressed: loopDone
              ? null
              : () {
                  isFilled == true
                      ? setState(() {
                          _currentStep++;
                          if (_currentStep > 2) {
                            _currentStep = 0;
                            loopDone = true;

                            Navigator.pushNamed(context, AppRouter.loanOffers);
                            setState(() {
                              isFilled == false;
                            });
                          }
                        })
                      : ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Please Fill in all the information')),
                        );
                },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5), // Rectangle shape
              ),
              backgroundColor: _currentStep == 2
                  ? AppColors.greyPAGEBLUE
                  : const Color.fromARGB(
                      255, 146, 145, 215), // Change the color as needed
              foregroundColor: Colors.white, // Change the color as needed
              padding: const EdgeInsets.all(16), // Change the padding as needed
              animationDuration: const Duration(milliseconds: 1000)),
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            // Make the button expand the full width
            alignment: Alignment.center,
            child: Text(
              _currentStep == 2 ? 'Submit' : 'Next',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(5),
      //     ),
      //     onPressed: () {}),
    );
  }
}
