import 'package:flutter/foundation.dart';

class UsersProvider  {
  String _name='กำลังโหลด...';

  String get name => _name;

  set name(String name) {
    _name = name;
  }
  String _phone='กำลังโหลด...';

  String get phone => _phone;

  set phone(String phone) {
    _phone = phone;
  }
  String _email='กำลังโหลด...';

  String get email => _email;

  set email(String email) {
    _email = email;
  }
  
}