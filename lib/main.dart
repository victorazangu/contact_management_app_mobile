import 'package:contact_management_app_mobile/screens/auth/login.dart';
import 'package:contact_management_app_mobile/screens/auth/register.dart';
import 'package:contact_management_app_mobile/viewmodels/contacts/contact_provider.dart';
import 'package:contact_management_app_mobile/viewmodels/groups/group_provider.dart';
import 'package:contact_management_app_mobile/widgets/mainNavigation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox<String>("tokenBox");

  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ContactProvider()),
      ChangeNotifierProvider(create: (_) => GroupProvider()),
    ],
    child: const MyApp(),
  );
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
