import 'package:shared_preferences/shared_preferences.dart';

class DataService {
  Future<UserData> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? firstName = prefs.getString('firstName');
    String? lastName = prefs.getString('lastName');
    String? email = prefs.getString('email');
    String? phone = prefs.getString('phone');

    // Assuming none of the values will be null. If they can be null, you should add null checks.
    return UserData(
        firstName: firstName!,
        lastName: lastName!,
        email: email!,
        phoneNumber: phone!);
  }

  Future setData(firsrName, lastName, email, phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('firstName', firsrName);
    prefs.setString('lastName', lastName);
    prefs.setString('email', email);
    prefs.setString('phone', phone);
  }
}

class UserData {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  UserData(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber});
}
