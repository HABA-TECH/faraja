import 'package:flutter/material.dart';
import 'package:haba/models/user.dart';
 

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
