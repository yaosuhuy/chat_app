import 'package:chat_app/resources/auth_methods.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/screens/signup_screen.dart';
import 'package:chat_app/ultis/ultis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  // mq = MediaQuery.of(context).size;
  // login user
  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == "success") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
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
              child: TextField(
                obscureText: true,
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
                    Icons.key_outlined,
                    color: const Color.fromARGB(40, 0, 0, 0),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(75, 0, 0, 0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.login),
                label: Text(
                  "Sign in",
                  style: TextStyle(
                    color: Color.fromARGB(130, 0, 0, 0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: SizedBox(
                  width: 25,
                  height: 25,
                  child: Image(
                    image: AssetImage('assets/images/google_logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                label: Text(
                  "Sign in with Google",
                  style: TextStyle(
                    color: Color.fromARGB(130, 0, 0, 0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: "Don't have an account yet? ",
                style: TextStyle(
                    fontSize: 14, color: const Color.fromARGB(99, 0, 0, 0)),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign up now!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
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
