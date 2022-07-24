import 'package:flutter/material.dart';
import 'package:ui_color_note/page/home_page.dart';
import 'package:ui_color_note/page/kalender_page.dart';
import 'package:ui_color_note/page/profile_page.dart';
import 'package:ui_color_note/page/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final screens = [
    HomePage(),
    kalenderPage(),
    SearchPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
      body: IndexedStack(
        index: index,
        children: screens,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.amberAccent.shade100,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Color.fromARGB(235, 232, 240, 255),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                selectedIcon: Icon(Icons.home)),
            NavigationDestination(
                icon: Icon(Icons.calendar_today), label: 'Kalender'),
            NavigationDestination(
                icon: Icon(Icons.search_outlined), label: 'Search'),
            NavigationDestination(
                icon: Icon(Icons.menu_book_outlined), label: 'Profile'),
          ],
        ),
      ));
}
