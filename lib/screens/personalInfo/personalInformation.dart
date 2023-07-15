import 'package:flutter/material.dart';
import 'package:haba/routes/appRouter.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:haba/utils/paddingUtil.dart';

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
  int? stepsNumber;
  String? chosenValue;
  DateTime? _selectedDate;
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final genderController = TextEditingController();

  // void incrementStep() {
  //   setState(() {
  //     if (selectedStep < 3) {
  //       selectedStep++;
  //     } else {
  //       selectedStep = 1; // reset to the first step if the end is reached
  //     }
  //   });
  // }
  Widget _circleStep(String text, int stepsNumber, headerText) {
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
  void initState() {
    // TODO: implement initState
    // genderController.dispose();
    // firstNameController.dispose();
    // lastNameController.dispose();
    super.initState();
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
                            _circleStep('1', 0, 'Basic'),
                            _circleStep('2', 1, 'Personal'),
                            _circleStep('3', 2, 'Referee'),
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
                                      hintText: "eg John",
                                      color: AppColors.greyPAGEBLUE,
                                      controller: firstNameController,
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
                                      hintText: "eg Kamau",
                                      color: AppColors.greyPAGEBLUE,
                                      controller: lastNameController,
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
                                                    ? 'Date: ${_selectedDate!.toIso8601String()}'
                                                    : 'Select Date of Birth'),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomTextField(
                                      text: 'Gender',
                                      hintText: "Male/Female",
                                      controller: genderController,
                                      inputType: TextInputType.text,
                                      obscureText: false,
                                    ),
                                  ),
                                ),
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
                                      controller: firstNameController,
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
                                      controller: lastNameController,
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
                                      controller: genderController,
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
                                      controller: genderController,
                                      inputType: TextInputType.number,
                                      obscureText: false,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CustomTextField(
                                      text: 'Marital Status',
                                      hintText: "Single / Married",
                                      controller: genderController,
                                      inputType: TextInputType.text,
                                      obscureText: false,
                                    ),
                                  ),
                                ),
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
                                              chosenValue = value;
                                            });
                                          },
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
                                    controller: lastNameController,
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
          onPressed: () {
            Navigator.pushNamed(context, AppRouter.loanOffers);
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5), // Rectangle shape
              ),
              backgroundColor: _currentStep == 2
                  ? AppColors.greyPAGEBLUE
                  : Colors.grey[400], // Change the color as needed
              foregroundColor: Colors.white, // Change the color as needed
              padding: EdgeInsets.all(16), // Change the padding as needed
              animationDuration: Duration(milliseconds: 1000)),
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            // Make the button expand the full width
            alignment: Alignment.center,
            child: Text(
              'Submit',
              style: TextStyle(fontSize: 18),
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
