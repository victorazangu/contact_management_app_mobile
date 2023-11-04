import 'package:contact_management_app_mobile/screens/group/group.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/contacts/contacts.dart';
import '../screens/home/homepage.dart';
import '../screens/profile/profile.dart';
import '../utils/defaultValues.dart';
import '../viewmodels/contacts/contact_provider.dart';
import '../viewmodels/groups/group_provider.dart';
import '../viewmodels/user/user_provider.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => GroupListViewModel(),
        ),
      ],
      child: const HomePage(),
    ),
    ChangeNotifierProvider(
      create: (_) => ContactListViewModel(),
      child: const Contacts(),
    ),
    ChangeNotifierProvider(
      create: (_) => GroupListViewModel(),
      child: Group(),
    ),
    ChangeNotifierProvider(
      create: (_) => UserListViewModel(),
      child: UserProfilePage(),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String title = _selectedIndex == 0
        ? ""
        : _selectedIndex == 1
            ? "Home"
            : _selectedIndex == 2
                ? "Contacts"
                : _selectedIndex == 3
                    ? "Group"
                    : _selectedIndex == 4
                        ? "Profile"
                        : "Unknown Screen";

    return Scaffold(
      backgroundColor: DefaultValues.mainPrimaryColor,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: DefaultValues.mainPrimaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_emergency),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
              size: 34,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        selectedIconTheme:
            const IconThemeData(color: DefaultValues.mainBackgroundColor),
        selectedLabelStyle: const TextStyle(fontSize: 0),
        selectedItemColor: DefaultValues.mainPrimaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
