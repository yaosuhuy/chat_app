import 'package:chat_app/screens/auth/login_screen.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 1, // shadow
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 19,
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
