import 'package:flutter/material.dart';

import '../utils/defaultValues.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreateContactForm extends StatefulWidget {
  @override
  _CreateContactFormState createState() => _CreateContactFormState();
}

class _CreateContactFormState extends State<CreateContactForm> {
  File? _selectedImage;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _imageController.dispose();
    _descriptionController.dispose();
    super.dispose();
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
              decoration: const InputDecoration(
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
              decoration: const InputDecoration(
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
            child: TextField(
              controller: _descriptionController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'Enter description',
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
                        DefaultValues.mainBackgroundColor),
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
              onPressed: () {
                final String name = _nameController.text;
                final String contact = _contactController.text;
                final String image = _imageController.text;
                final String description = _descriptionController.text;
                print('Name: $name');
                print('Name: $contact');
                print('Image: $image');
                print('Description: $description');

                _nameController.clear();
                _contactController.clear();
                _imageController.clear();
                _descriptionController.clear();
              },
              child: Text('Add Contact'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    DefaultValues.mainBackgroundColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
