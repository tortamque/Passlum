import 'package:flutter/material.dart';
import 'package:passlum/theme/constants.dart';

class Button extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const Button({
    required this.title,
    required this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: CustomColors.darkBlue,
        backgroundColor: CustomColors.lightBlue,
        minimumSize: const Size.fromHeight(50),
        surfaceTintColor: Colors.white,
        elevation: 10,
      ),
      onPressed: onPressed,
      child: Text(
        title, 
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 21
        ),
      ),
    );
  }
}