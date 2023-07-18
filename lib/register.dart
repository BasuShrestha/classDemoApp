import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:layout_app/home.dart';
import 'package:layout_app/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController cFname = TextEditingController();
  TextEditingController cLname = TextEditingController();
  TextEditingController cAddress = TextEditingController();
  TextEditingController cEmail = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController cUserBio = TextEditingController();

  void insertInput() {
    var url = "http://localhost/New_API/Auth/register.php";
    // http.post(url, body: {
    //   "fname": cFname.text,
    //   "lname": cLname.text,
    //   "address": cAddress.text,
    //   "email": cEmail.text,
    //   "password": cPassword.text,
    //   "user_bio": cUserBio.text,
    // });
  }

  @override
  Widget build(BuildContext context) {
    var registerFormKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: registerFormKey,
              child: Column(
                children: [
                  AspectRatio(
                      aspectRatio: 2,
                      child: Image.asset('assets/Walmart_logo.png')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 173,
                        child: TextFormField(
                          controller: cFname,
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                            hintText: 'Enter your first name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your first name";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 173,
                        child: TextFormField(
                          controller: cLname,
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                            hintText: 'Enter your last name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your last name";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: cAddress,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                      hintText: 'Enter your address',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.location_on),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your address";
                      } else if (value.length < 8) {
                        return "Not a valid password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: cEmail,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'user@email.com',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email address";
                      } else if (value.length < 8) {
                        return "Not a valid password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 8) {
                        return "Not a valid password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: cPassword,
                    decoration: const InputDecoration(
                      labelText: 'Confirm password',
                      hintText: 'Re-enter your password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 8) {
                        return "Not a valid password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: cUserBio,
                    decoration: const InputDecoration(
                      labelText: 'Bio',
                      hintText: 'Write something about yourself',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade400,
                    ),
                    onPressed: () {
                      if (registerFormKey.currentState!.validate()) {
                        insertInput();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                    },
                    child: const Text('Register'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.amber.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
