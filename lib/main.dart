import 'package:contact_management_app_mobile/screens/auth/login.dart';
import 'package:contact_management_app_mobile/screens/auth/register.dart';
import 'package:contact_management_app_mobile/widgets/mainNavigation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox<String>("tokenBox");

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

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
