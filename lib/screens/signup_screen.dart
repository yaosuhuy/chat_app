import 'package:chat_app/resources/auth_methods.dart';
import 'package:chat_app/screens/auth/login_screen.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/ultis/ultis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;
  String? _errorText = null;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  bool validatePassword() {
    setState(() {
      if (_confirmPasswordController.text.isEmpty) {
        _errorText = null;
      } else if (_confirmPasswordController.text != _passwordController.text) {
        _errorText = "Confirm password does not match!";
      } else {
        _errorText = null;
      }
    });
    return _confirmPasswordController.text == _passwordController.text;
  }

  // mq = MediaQuery.of(context).size;
  // signup user
  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      username: _usernameController.text,
      password: _passwordController.text,
    );
    if (res == "success") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
      showSnackBar("Account created successfully!", context);
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // make space for the left space
        title: const Text('Welcome to ChatApp'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image(
                image: AssetImage(
                  'assets/images/logo.png',
                ),
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: const Color.fromARGB(10, 0, 0, 0)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: const Color.fromARGB(52, 0, 0, 0)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.people_outlined,
                    color: const Color.fromARGB(40, 0, 0, 0),
                  ),
                  hintText: 'Username',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(75, 0, 0, 0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: const Color.fromARGB(10, 0, 0, 0)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: const Color.fromARGB(52, 0, 0, 0)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: const Color.fromARGB(40, 0, 0, 0),
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(75, 0, 0, 0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: StatefulBuilder(
                builder: (context, setState) {
                  bool isObsecure = true;
                  return TextField(
                    controller: _passwordController,
                    obscureText: isObsecure,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(10, 0, 0, 0)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(52, 0, 0, 0)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.key_outlined,
                        color: const Color.fromARGB(40, 0, 0, 0),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(
                            () {
                              isObsecure = !isObsecure;
                            },
                          );
                        },
                        icon: Icon(isObsecure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        color: const Color.fromARGB(40, 0, 0, 0),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(75, 0, 0, 0),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 30),
            //   child: TextField(
            //     controller: _confirmPasswordController,
            //     // change confirmPassword while typing, not click "sign up"
            //     onChanged: (value) => validatePassword(),
            //     obscureText: _isObsecure,
            //     decoration: InputDecoration(
            //       enabledBorder: OutlineInputBorder(
            //         borderSide:
            //             BorderSide(color: const Color.fromARGB(10, 0, 0, 0)),
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(30),
            //         ),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide:
            //             BorderSide(color: const Color.fromARGB(52, 0, 0, 0)),
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(30),
            //         ),
            //       ),
            //       prefixIcon: Icon(
            //         Icons.key_outlined,
            //         color: const Color.fromARGB(40, 0, 0, 0),
            //       ),
            //       suffixIcon: IconButton(
            //         onPressed: () {
            //           setState(
            //             () {
            //               _isObsecure != _isObsecure;
            //             },
            //           );
            //         },
            //         icon: Icon(_isObsecure
            //             ? Icons.visibility_outlined
            //             : Icons.visibility_off_outlined),
            //         color: const Color.fromARGB(40, 0, 0, 0),
            //       ),
            //       hintText: 'Confirm Password',
            //       hintStyle: TextStyle(
            //         color: const Color.fromARGB(75, 0, 0, 0),
            //       ),
            //       errorText: _errorText,
            //     ),
            //   ),
            // ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  validatePassword()
                      ? signUpUser()
                      : showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Alert!"),
                              content: Text(
                                  "Confirm password does not match, please try again!"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Đóng dialog
                                  },
                                  child: Text('Try again'),
                                ),
                              ],
                            );
                          },
                        );
                },
                icon: Icon(Icons.login),
                label: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Text(
                        "Sign up",
                        style: TextStyle(
                          color: Color.fromARGB(130, 0, 0, 0),
                        ),
                      ),
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: "Already have an account? ",
                style: TextStyle(
                    fontSize: 14, color: const Color.fromARGB(99, 0, 0, 0)),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign in now!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
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
