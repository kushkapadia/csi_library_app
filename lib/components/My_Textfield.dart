import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String textHint;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.textHint,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0,
        ),
      ]),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Email',
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.all(20),
          prefixIconConstraints: BoxConstraints(minWidth: 50),
        ),
      ),
    );
  }
}
