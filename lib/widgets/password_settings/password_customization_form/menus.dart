import 'package:flutter/material.dart';
import 'package:passlum/enums/password_type.dart';
import 'package:passlum/models/password_settings.dart';
import 'package:passlum/widgets/password_settings/password_customization_form/check_box.dart';
import 'package:passlum/widgets/password_settings/password_customization_form/radio_button.dart';

// ignore: must_be_immutable
class LeftMenu extends StatefulWidget {
  final Function() onTypeChanged;

  const LeftMenu({
    required this.onTypeChanged,
    super.key
  });

  @override
  State<LeftMenu> createState() => _LeftMenuState();
}

class _LeftMenuState extends State<LeftMenu> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          RadioButton(
            type: PasswordSettings().type, 
            title: "Easy to say", 
            onChanged: (PasswordType? newValue){
              setState(() {
                PasswordSettings().type = newValue!;

                PasswordSettings().isNumeric = false;
                PasswordSettings().isSymbolic = false;
                PasswordSettings().isUppercase = true;
                PasswordSettings().isLowercase = true;

                widget.onTypeChanged();
              });}, 
            value: PasswordType.easyToSay
          ),

          RadioButton(
            type: PasswordSettings().type, 
            title: "Easy to read", 
            onChanged: (PasswordType? newValue){
              setState(() {
                PasswordSettings().type = newValue!;

                widget.onTypeChanged();
              });}, 
            value: PasswordType.easyToRead
          ),
          
          RadioButton(
            type: PasswordSettings().type, 
            title: "All characters", 
            onChanged: (PasswordType? newValue){
              setState(() {
                PasswordSettings().type = newValue!;

                widget.onTypeChanged();
              });},
            value: PasswordType.allCharacters
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class RightMenu extends StatefulWidget {
  const RightMenu({
    super.key
  });

  @override
  State<RightMenu> createState() => _RightMenuState();
}

class _RightMenuState extends State<RightMenu> {
  bool checkValues(bool newValue){
    int falseCount = !newValue ? 1 : 0;

    if (!PasswordSettings().isUppercase) falseCount++;
    if (!PasswordSettings().isLowercase) falseCount++;
    if (!PasswordSettings().isNumeric)   falseCount++;
    if (!PasswordSettings().isSymbolic)  falseCount++;

    return falseCount < 4;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          CheckBox(
            title: "Uppercase", 
            value: PasswordSettings().isUppercase, 
            onChanged: (bool? newValue){
              setState(() {
                checkValues(newValue!) ? PasswordSettings().isUppercase = newValue : null;
              });
            },
            isEnabled: true,
          ),
          CheckBox(
            title: "Lowercase", 
            value: PasswordSettings().isLowercase, 
            onChanged: (bool? newValue){
              setState(() {
                checkValues(newValue!) ? PasswordSettings().isLowercase = newValue : null;
              });
            },
            isEnabled: true,
          ),
          CheckBox(
            title: "Numbers", 
            value: PasswordSettings().isNumeric, 
            onChanged: (bool? newValue){
              setState(() {
                PasswordSettings().type == PasswordType.easyToSay ? null : (checkValues(newValue!) ? PasswordSettings().isNumeric = newValue : null);
              });
            },
            isEnabled: PasswordSettings().type == PasswordType.easyToSay ? false : true,
          ),
          CheckBox(
            title: "Symbols", 
            value: PasswordSettings().isSymbolic, 
            onChanged: (bool? newValue){
              setState(() {
                PasswordSettings().type == PasswordType.easyToSay ? null : (checkValues(newValue!) ? PasswordSettings().isSymbolic = newValue : null);
              });
            },
            isEnabled: PasswordSettings().type == PasswordType.easyToSay ? false : true,
          ),
        ],
      ),
    );
  }
}