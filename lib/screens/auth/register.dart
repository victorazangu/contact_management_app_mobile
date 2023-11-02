import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../../utils/defaultValues.dart';
import '../../utils/styles.dart';

class Register extends StatefulWidget {
  static String id = '/RegisterPage';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _phone = '';
  String _password = '';
  String _password_confirmation = '';

  final AuthWebService _registerWebService = AuthWebService();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        var data = {
          "name": _name,
          "email": _email,
          "phone": _phone,
          "password": _password,
          "password_confirmation": _password_confirmation,
        };
        print("data  $data");
        Map<String, dynamic>? userData =
            await _registerWebService.register(data);
        print("user data after register $userData");

        if (userData != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created  Login '),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacementNamed(context, "/");
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please try again.'),
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DefaultValues.mainBackgroundColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Center(
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 100.0,
                            width: 100.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: AlignmentDirectional.center,
                        child: const Text(
                          "Create Account",
                          style: ThemeStyling.medium_20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              style: const TextStyle(color: Colors.grey),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(
                                  Icons.person_outline,
                                  color: Colors.grey,
                                ),
                                hintText: 'Name',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _name = value as String;
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              style: const TextStyle(color: Colors.grey),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.grey,
                                ),
                                hintText: 'Email',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _email = value as String;
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              style: const TextStyle(color: Colors.grey),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                ),
                                hintText: 'Phone',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _phone = value as String;
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              style: const TextStyle(color: Colors.grey),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                ),
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _password = value as String;
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              style: const TextStyle(color: Colors.grey),
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                ),
                                hintText: 'Password again',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password again';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _password_confirmation = value as String;
                              },
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: _submitForm,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: FractionallySizedBox(
                              widthFactor: 0.5,
                              child: Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.all(12.0),
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: GestureDetector(
                          child: const Text(
                            'Have an account? Sign in',
                            style: TextStyle(
                              color: DefaultValues.mainPrimaryColor,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/');
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
