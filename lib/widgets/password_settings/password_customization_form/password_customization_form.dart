import 'package:flutter/material.dart';
import 'package:passlum/widgets/password_settings/password_customization_form/menus.dart';

class PasswordCustomizationForm extends StatefulWidget {
  const PasswordCustomizationForm({super.key});

  @override
  State<PasswordCustomizationForm> createState() => _PasswordCustomizationFormState();
}

class _PasswordCustomizationFormState extends State<PasswordCustomizationForm> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Row(
        children: [
          LeftMenu(
            onTypeChanged: (){
              setState(() {
              });
            },
          ),

          RightMenu()
        ],
      ),
    );
  }
}