import 'package:flutter/material.dart';

import '../../utils/defaultValues.dart';

class Register extends StatefulWidget {
  static String id = '/RegisterPage';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String _email = '';
  // String _password = '';
  // void _submitForm() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     try {
  //       Map<String, dynamic>? userData =

  //       if (userData != null) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text(
  //                 'Welcome back ${userData['first_name']} ${userData['last_name']}'),
  //             behavior: SnackBarBehavior.floating,
  //             backgroundColor: DefaultValues.mainBackgroundColor,
  //           ),
  //         );
  //         Navigator.pushReplacementNamed(context, "/");
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(
  //             content: Text('Credential error. Please try again.'),
  //             behavior: SnackBarBehavior.floating,
  //             backgroundColor: DefaultValues.mainPrimaryColor,
  //           ),
  //         );
  //       }
  //     } catch (e) {
  //       print('Error occurred: $e');
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DefaultValues.mainBackgroundColor,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Center(
                        child: Image.network(
                          'https://www.uzapoint.com/assets/img/dashboard_logo.png',
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
                        style: TextStyle(color: DefaultValues.mainPrimaryColor),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      //  'name',
                      //   'email',
                      //   'profile',
                      //   'phone',
                      //   'password',
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
                            onSaved: (value) {},
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
                            onSaved: (value) {},
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
                            onSaved: (value) {},
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
                            onSaved: (value) {},
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
                        onTap: () =>
                            {Navigator.pushReplacementNamed(context, '/')},
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
                          'Have account? sign in',
                          style:
                              TextStyle(color: DefaultValues.mainPrimaryColor),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
