import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  const FormTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Customize your password",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26
      ),
    );
  }
}