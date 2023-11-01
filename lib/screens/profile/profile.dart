import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../utils/defaultValues.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = "Victor Azangu";
  String phone = "+1234567890";
  String email = "victorsazangu@gmail.com";
  File? profileImage;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        color: const Color.fromARGB(255, 66, 41, 7),
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildProfileImage(),
              buildInfoField("Name", name, nameController),
              buildInfoField("Phone", phone, phoneController),
              buildInfoField("Email", email, emailController),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return DefaultValues.mainPrimaryColor.withOpacity(0.5);
                      }
                      return DefaultValues.mainPrimaryColor;
                    },
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (isEditing) {
                      name = nameController.text;
                      phone = phoneController.text;
                      email = emailController.text;
                    }
                    isEditing = !isEditing;
                  });
                },
                child: Text(isEditing ? 'Save' : 'Edit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoField(
      String label, String value, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          isEditing
              ? TextField(
                  controller: controller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter $label',
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: DefaultValues.mainPrimaryColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: DefaultValues.mainPrimaryColor,
                      ),
                    ),
                  ),
                )
              : Text(
                  value,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildProfileImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isEditing
            ? GestureDetector(
                onTap: () async {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      profileImage = File(image.path);
                    });
                  }
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: profileImage != null
                      ? FileImage(profileImage!)
                      : AssetImage('assets/images/default.png')
                          as ImageProvider,
                ),
              )
            : CircleAvatar(
                radius: 50,
                backgroundImage: profileImage != null
                    ? FileImage(profileImage!)
                    : AssetImage('assets/images/default.png') as ImageProvider,
              ),
        SizedBox(height: 10),
      ],
    );
  }
}
