import 'package:flutter/cupertino.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedindex = 0;

  int get selectedIndex => _selectedindex;
  List listOfAppBarTittle = [
    "Maps",
    "Graphs",
    "Emergency",
    "More",
  ];
  int curentIndex = 0;

  updateSelectedIndex(int index, PageController controller, bool animate) {
    _selectedindex = index;
    animate ? controller.jumpToPage(index) : null;
    notifyListeners();
  }
}