import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../services/user_service.dart';
import '../../utils/defaultValues.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  File? _image;
  final picker = ImagePicker();

  String name = '';
  String email = '';
  String phone = '';

  final UserWebService _userWebService = UserWebService();
  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  Future<void> getProfileData() async {
    try {
      Map<String, dynamic>? userData = await _userWebService.profile();
      if (userData != null) {
        setState(() {
          name = userData['name'];
          email = userData['email'];
          phone = userData['phone'];
        });
      }
    } catch (error) {
      print('Error fetching profile data: $error');
    }
  }

  void _getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object>? imageProvider;

    if (_image != null) {
      imageProvider = FileImage(_image!);
    } else {
      imageProvider = AssetImage('assets/images/default.png');
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          _buildProfileImageField(context, imageProvider),
          SizedBox(
            height: 10,
          ),
          _buildProfileField(context, 'Name', name),
          SizedBox(
            height: 10,
          ),
          _buildProfileField(context, 'Email', email),
          SizedBox(
            height: 10,
          ),
          _buildProfileField(context, 'Phone', phone),
          SizedBox(height: 16.0),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  DefaultValues.mainPrimaryColorDarker),
            ),
            onPressed: () {
              _submitProfileChanges();
            },
            child: Text('Save Changes'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileField(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _showEditModal(context, label, value, (newValue) {
                  if (label == 'Name') {
                    setState(() {
                      name = newValue;
                    });
                  } else if (label == 'Email') {
                    setState(() {
                      email = newValue;
                    });
                  } else if (label == 'Phone') {
                    setState(() {
                      phone = newValue;
                    });
                  }
                });
              },
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  Widget _buildProfileImageField(
      BuildContext context, ImageProvider<Object> imageProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Profile',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: imageProvider,
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _getImageFromGallery();
              },
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  void _showEditModal(BuildContext context, String label, String currentValue,
      Function(String) onSave) {
    TextEditingController textController =
        TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $label'),
          content: TextField(controller: textController),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onSave(textController.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _submitProfileChanges() async {
    var imagePath = _image != null ? _image!.path : null;
    try {
      var data = {
        "name": name,
        "email": email,
        "phone": phone,
        "profile": imagePath
      };
      Map<String, dynamic>? userData =
          await _userWebService.updateUserProfile(data);
      print("Res data at profile page $userData");

      if (userData != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Updated Successfull'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error Please try again.'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
