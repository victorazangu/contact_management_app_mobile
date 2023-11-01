import 'package:flutter/material.dart';

import '../screens/profile/profile.dart';
import '../screens/group/group.dart';
import '../screens/home/homepage.dart';
import '../screens/contacts/contacts.dart';
import '../utils/defaultValues.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // void _changeSelectedIndex(int newIndex) {
  //   setState(() {
  //     _selectedIndex = newIndex;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    String title = _selectedIndex == 0
        ? "Home"
        : _selectedIndex == 1
            ? "Contacts"
            : _selectedIndex == 2
                ? "Group"
                : _selectedIndex == 3
                    ? "Profile"
                    : "Unknown Screen";

    return Scaffold(
      // Use a Container with a background image
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
      ),
      appBar: AppBar(
        backgroundColor: DefaultValues.mainPrimaryColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/default.png'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: DefaultValues.mainBackgroundColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_emergency),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
              size: 34,
            ),
            label: 'Group',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        selectedIconTheme:
            const IconThemeData(color: DefaultValues.mainPrimaryColor),
        selectedLabelStyle: const TextStyle(fontSize: 0),
        selectedItemColor: DefaultValues.mainPrimaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Contacts(),
    Group(),
    Profile(),
  ];
}
