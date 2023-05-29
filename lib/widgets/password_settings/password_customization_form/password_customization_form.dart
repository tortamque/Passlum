import 'package:flutter/material.dart';
import 'package:passlum/enums/password_type.dart';
import 'package:passlum/widgets/password_settings/password_customization_form/menus.dart';

class PasswordCustomizationForm extends StatefulWidget {
  const PasswordCustomizationForm({super.key});

  @override
  State<PasswordCustomizationForm> createState() => _PasswordCustomizationFormState();
}

class _PasswordCustomizationFormState extends State<PasswordCustomizationForm> {
  PasswordType type = PasswordType.allCharacters;
  bool isUppercase = true;
  bool isLowercase = true;
  bool isNumeric = false;
  bool isSymbolic = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Row(
        children: [
          LeftMenu(
            type: type
          ),

          RightMenu(
            isUppercase: isUppercase, 
            isLowercase: isLowercase, 
            isNumeric: isNumeric, 
            isSymbolic: isSymbolic
          )
        ],
      ),
    );
  }
}