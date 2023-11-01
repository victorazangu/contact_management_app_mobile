import 'package:contact_management_app_mobile/screens/auth/login.dart';
import 'package:contact_management_app_mobile/screens/auth/register.dart';
import 'package:contact_management_app_mobile/widgets/mainNavigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact manager',
      routes: {
        '/': (context) {
          return const Login();
        },
        '/register': (context) {
          return Register();
        },
        '/home': (context) {
          return const MainNavigation();
        },
      },
    );
  }
}
