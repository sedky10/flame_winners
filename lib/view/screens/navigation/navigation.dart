import 'package:flame_winners/view/global/util/custom_fonts.dart';
import 'package:flame_winners/view/screens/emergency/emergency_screen.dart';
import 'package:flame_winners/view/screens/graphs/graphs_screen.dart';
import 'package:flame_winners/view/screens/maps/map_screen.dart';
import 'package:flame_winners/view/screens/more/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/providers/navigation_screen.dart';
import '../../global/util/colors.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late final List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': MapScreen(), 'title': 'Maps'},
      {'page': GraphScreen(), 'title': 'Graphs'},
      {'page': EmergencyScreen(), 'title': 'Emergency'},
      {'page': MoreScreen(), 'title': 'More'},
    ];
  }

  final PageController _pageController = PageController(initialPage: 0);
  double iconPadding = 5;

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
        builder: (context, navigationProvider, child) {
      return Container(
        color: ColorResources.whiteColor,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                navigationProvider.listOfAppBarTittle[navigationProvider.curentIndex],
                style: heading2Bold.copyWith(color: Colors.black),
              ),
              centerTitle: true,
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedFontSize: 12,
              unselectedFontSize: 12,
              backgroundColor: Theme.of(context).primaryColor,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey[350],
              currentIndex: navigationProvider.selectedIndex,
              onTap: (index) {
                navigationProvider.updateSelectedIndex(
                    index, _pageController, true);
                _pageController.animateTo(index as double,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInBack);
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.all(iconPadding),
                      child: Icon(Icons.maps_home_work_outlined),
                    ),
                    label: 'Maps'),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.all(iconPadding),
                      child: Icon(Icons.graphic_eq_sharp),
                    ),
                    label: 'Graphs'),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.all(iconPadding),
                      child: Icon(Icons.emergency_share),
                    ),
                    label: 'Emergency'),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.all(iconPadding),
                      child: Icon(Icons.more_horiz),
                    ),
                    label: 'More'),
              ],
            ),
            body: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return _pages[index]['page'];
              },
              onPageChanged: (int index) {
                navigationProvider.curentIndex=index;
                navigationProvider.updateSelectedIndex(
                    index, _pageController, false);
              },
            ),
          ),
        ),
      );
    });
  }
}
