import 'package:flutter/cupertino.dart';
class registerCredential with ChangeNotifier {
  String _email = '';
  String _password = '';
  String _phone = '';
  String _name = '';


  String get email => _email;
  String get password => _password;
  String get phone => _phone;
  String get name => _name;

  void updateCredentials(String email, String password,String phone,String name) {
    _email = email;
    _password = password;
    _phone = phone;
    _name = name;

    notifyListeners();
  }
}