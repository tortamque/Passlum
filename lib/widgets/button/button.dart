import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:passlum/models/password_generator.dart';
import 'package:passlum/theme/constants.dart';

class Button extends StatelessWidget {
  const Button({
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
      onPressed: (){
        Clipboard.setData(
          ClipboardData(
            text: PasswordGenerator().password
          )
        );
        showToast(
          "Password was successfully copied",
          position: ToastPosition.bottom,
          radius: 10.0,
        );
      },
      child: const Text(
        "Copy password", 
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 21
        ),
      ),
    );
  }
}