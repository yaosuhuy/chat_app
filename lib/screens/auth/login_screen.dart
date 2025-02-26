import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // mq = MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // make space for the left space
        title: const Text('Welcome to ChatApp'),
      ),
      body: Column(
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
        ],
      ),
    );
  }
}
