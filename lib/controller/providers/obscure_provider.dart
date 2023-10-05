import 'package:flutter/cupertino.dart';

class ObscureProvider extends ChangeNotifier {
  bool _isObscure = false;

  bool get isObscure => _isObscure;

  set isObscure(bool value) {
    _isObscure = value;
    notifyListeners();
  }
}