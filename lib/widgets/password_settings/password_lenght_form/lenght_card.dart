import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordLenghtCard extends StatelessWidget {
  int passwordLenght;

  PasswordLenghtCard({
    required this.passwordLenght,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
              BoxShadow(
              color: Colors.grey,
            ),
            BoxShadow(
              color: Colors.white,
              spreadRadius: -0.01,
              blurRadius: 3,
            ),
          ]
        ),
        width: 80,
        height: 40,
        child: Center(child: 
          Text(
            passwordLenght.toString(), 
            style: const TextStyle(
              fontSize: 16
            ),
          )
        ),
      ),
    );
  }
}