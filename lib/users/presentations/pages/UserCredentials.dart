import 'package:flutter/cupertino.dart';
class UserCredentials with ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  void updateCredentials(String email, String password) {
    _email = email;
    _password = password;
    notifyListeners();
  }
}