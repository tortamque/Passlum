import 'package:flutter/material.dart';

class PasswordLenghtSubtitle extends StatelessWidget {
  const PasswordLenghtSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Password lenght",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 17
      ),
    );
  }
}