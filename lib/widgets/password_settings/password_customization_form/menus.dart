import 'package:flutter/material.dart';
import 'package:passlum/enums/password_type.dart';
import 'package:passlum/widgets/password_settings/password_customization_form/check_box.dart';
import 'package:passlum/widgets/password_settings/password_customization_form/radio_button.dart';

// ignore: must_be_immutable
class LeftMenu extends StatefulWidget {
  PasswordType type;

  LeftMenu({
    required this.type,
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
            type: widget.type, 
            title: "Easy to say", 
            onChanged: (PasswordType? newValue){
              setState(() {
                widget.type = newValue!;
              });}, 
            value: PasswordType.easyToSay
          ),

          RadioButton(
            type: widget.type, 
            title: "Easy to read", 
            onChanged: (PasswordType? newValue){
              setState(() {
                widget.type = newValue!;
              });}, 
            value: PasswordType.easyToRead
          ),
          
          RadioButton(
            type: widget.type, 
            title: "All characters", 
            onChanged: (PasswordType? newValue){
              setState(() {
                widget.type = newValue!;
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
  bool isUppercase;
  bool isLowercase;
  bool isNumeric;
  bool isSymbolic;

  RightMenu({
    required this.isUppercase,
    required this.isLowercase,
    required this.isNumeric,
    required this.isSymbolic,
    super.key
  });

  @override
  State<RightMenu> createState() => _RightMenuState();
}

class _RightMenuState extends State<RightMenu> {
  bool checkValues(bool newValue){
    int falseCount = !newValue ? 1 : 0;

    if (!widget.isUppercase) falseCount++;
    if (!widget.isLowercase) falseCount++;
    if (!widget.isNumeric)   falseCount++;
    if (!widget.isSymbolic)  falseCount++;

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
            value: widget.isUppercase, 
            onChanged: (bool? newValue){
              setState(() {
                checkValues(newValue!) ? widget.isUppercase = newValue : null;
              });
            }
          ),
          CheckBox(
            title: "Lowercase", 
            value: widget.isLowercase, 
            onChanged: (bool? newValue){
              setState(() {
                checkValues(newValue!) ? widget.isLowercase = newValue : null;
              });
            }
          ),
          CheckBox(
            title: "Numbers", 
            value: widget.isNumeric, 
            onChanged: (bool? newValue){
              setState(() {
                checkValues(newValue!) ? widget.isNumeric = newValue : null;
              });
            }
          ),
          CheckBox(
            title: "Symbols", 
            value: widget.isSymbolic, 
            onChanged: (bool? newValue){
              setState(() {
                checkValues(newValue!) ? widget.isSymbolic = newValue : null;
              });
            }
          ),
        ],
      ),
    );
  }
}