import 'package:flutter/material.dart';
import '../../utils/defaultValues.dart';
import '../../widgets/item_card.dart';
import '../group/group.dart';

class HomePage extends StatefulWidget {
  // final Function(int) changeSelectedIndex;

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              style: TextStyle(
                  color: DefaultValues.textColor, fontFamily: 'Regular'),
              decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.search, color: DefaultValues.textColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintText: 'Find contacts',
                  hintStyle: const TextStyle(
                      color: DefaultValues.textColor, fontFamily: 'Regular'),
                  fillColor: DefaultValues.secondaryColor,
                  filled: true),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
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
                  onTap: () => {
                    print("cliked")
                    // widget.changeSelectedIndex(1)
                  },
                  child: const Text(
                    'view all',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ItemCard(
                    name: 'Victor Azangu',
                    contact: '+254726262626',
                    image: 'assets/images/bg.jpg',
                    date: '12th Dec 2023',
                    liked: true,
                  ),
                  ItemCard(
                    name: 'Victor Azangu',
                    contact: '+254726262626',
                    image: 'assets/images/bg.jpg',
                    date: '12th Dec 2023',
                    liked: true,
                  ),
                  ItemCard(
                    name: 'Victor Azangu',
                    contact: '+254726262626',
                    image: 'assets/images/bg.jpg',
                    date: '12th Dec 2023',
                    liked: true,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
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
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ItemCard(
                    name: 'Victor Azangu',
                    contact: '+254726262626',
                    image: 'assets/images/bg.jpg',
                    date: '12th Dec 2023',
                    liked: true,
                  ),
                  ItemCard(
                    name: 'Victor Azangu',
                    contact: '+254726262626',
                    image: 'assets/images/bg.jpg',
                    date: '12th Dec 2023',
                    liked: true,
                  ),
                  ItemCard(
                    name: 'Victor Azangu',
                    contact: '+254726262626',
                    image: 'assets/images/bg.jpg',
                    date: '12th Dec 2023',
                    liked: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
