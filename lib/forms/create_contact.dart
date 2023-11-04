import 'package:flutter/material.dart';
import '../services/contact_service.dart';
import '../utils/defaultValues.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dio/dio.dart';

class CreateContactForm extends StatefulWidget {
  @override
  _CreateContactFormState createState() => _CreateContactFormState();
}

class _CreateContactFormState extends State<CreateContactForm> {
  File? _selectedImage;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final ContactWebService _contactWebService = ContactWebService();

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    final String name = _nameController.text;
    final String contact = _contactController.text;
    _nameController.clear();
    _contactController.clear();

    FormData formData = FormData.fromMap({
      "name": name,
      "contact": contact,
      "image": await MultipartFile.fromFile(_selectedImage!.path),
    });

    try {
      var c = await _contactWebService.createContact(formData);

      if (c != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Contact added'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error. Please try again.'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
          ),
        );
      }
      setState(() {
        _selectedImage = null;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: TextField(
              controller: _nameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Contact Name',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter contact name',
                hintStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5, top: 5),
            child: TextField(
              controller: _contactController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Contact',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter contact information',
                hintStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5, top: 5),
            child: Column(
              children: [
                if (_selectedImage != null)
                  Container(
                    child: Image.file(
                      _selectedImage!,
                      fit: BoxFit.cover,
                    ),
                    height: 40,
                  ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      DefaultValues.mainBackgroundColor,
                    ),
                  ),
                  onPressed: () async {
                    final XFile? image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);

                    if (image != null) {
                      setState(() {
                        _selectedImage = File(image.path);
                      });
                    }
                  },
                  child: Text('Upload Image'),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.0),
          Container(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(
              onPressed: _submitForm,
              child: Text('Add Contact'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  DefaultValues.mainBackgroundColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
