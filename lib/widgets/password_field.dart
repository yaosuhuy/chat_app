import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final bool isConfirmPasswordField;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  const PasswordField({super.key, required this.controller, this.onChanged, this.isConfirmPasswordField = false, this.errorText});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: isObsecure,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(10, 0, 0, 0)),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(52, 0, 0, 0)),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          prefixIcon: Icon(
            Icons.key_outlined,
            color: const Color.fromARGB(40, 0, 0, 0),
          ),
          suffixIcon: IconButton(
            icon: Icon(isObsecure
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined),
            color: const Color.fromARGB(40, 0, 0, 0),
            onPressed: () {
              setState(
                () {
                  isObsecure = !isObsecure;
                },
              );
            },
          ),
          hintText: widget.isConfirmPasswordField ? 'Confirm Password' : 'Password',
          hintStyle: TextStyle(
            color: const Color.fromARGB(75, 0, 0, 0),
          ),
          errorText: widget.errorText
        ),
      ),
    );
  }
}
