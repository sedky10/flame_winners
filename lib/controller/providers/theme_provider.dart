import 'package:flutter/foundation.dart';
class ThemeProvider with ChangeNotifier {

  late bool darkTheme = false;
  bool get DarkTheme => darkTheme;

  void toggleTheme() {
    darkTheme = !darkTheme;
    notifyListeners();
  }

}