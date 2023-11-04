import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../../services/user_service.dart';
import '../../utils/defaultValues.dart';
import '../../viewmodels/contacts/contact_provider.dart';
import '../../viewmodels/groups/group_provider.dart';
import '../../widgets/item_card.dart';
import '../auth/login.dart';
import '../contacts/contacts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserWebService _logoutWebService = UserWebService();

  void _handleLogoutAndNavigateToLogin(BuildContext context) {
    _logoutWebService.logout();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
      (route) => false,
    );
  }

  Future<void> _confirmLogout(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: DefaultValues.mainPrimaryColor,
          title: const Text(
            'Confirm Logout',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'Are you sure you want to log out?',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                _handleLogoutAndNavigateToLogin(context);
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<ContactListViewModel>(context, listen: false).allContacts();
    Provider.of<GroupListViewModel>(context, listen: false).allGroups();
  }

  @override
  Widget build(BuildContext context) {
    var contactProvider = Provider.of<ContactListViewModel>(context);
    var contacts = contactProvider.contacts;
    var groupProvider = Provider.of<GroupListViewModel>(context);
    var groups = groupProvider.groups;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.logout_rounded),
                    onPressed: () {
                      _confirmLogout(context);
                    },
                  ),
                ],
              ),
            ),
            TextField(
              style: const TextStyle(
                  color: DefaultValues.textColor, fontFamily: 'Regular'),
              decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.search, color: DefaultValues.textColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintText: 'Find contacts',
                  hintStyle: const TextStyle(
                      color: DefaultValues.textColor, fontFamily: 'Regular'),
                  fillColor: DefaultValues.secondaryColor,
                  filled: true),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Contacts ',
                  style: TextStyle(color: Colors.orange),
                ),
                GestureDetector(
                  onTap: () {
                    print("to be implemented");
                  },
                  child: const Text(
                    'view all',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: contacts.map((contact) {
                  return ItemCard(
                    name: contact.name,
                    contact: contact.contact,
                    image: 'assets/images/bg.jpg',
                    date: contact.created_at,
                    liked: true,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text(
                      'Groups',
                      style: TextStyle(color: Colors.orange),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.local_fire_department_rounded,
                      color: Colors.orange,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => {print("cliked")},
                  child: const Text(
                    'view all',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: groups.map((group) {
                  return ItemCard(
                    name: group.name,
                    contact: "",
                    image: 'assets/images/bg.jpg',
                    date: group.created_at,
                    liked: true,
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
