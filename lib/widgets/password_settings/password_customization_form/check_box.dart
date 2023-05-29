import 'package:flutter/material.dart';
import 'package:passlum/theme/constants.dart';

// ignore: must_be_immutable
class CheckBox extends StatelessWidget {
  String title;
  bool value;
  Function(bool? newValue) onChanged;
  bool isEnabled;

  CheckBox({
    required this.title,
    required this.value,
    required this.onChanged,
    required this.isEnabled,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      enabled: isEnabled,
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      controlAffinity: ListTileControlAffinity.leading,
      value: value, 
      activeColor: CustomColors.darkBlue,
      checkColor: Colors.white,
      onChanged: onChanged
    );
  }
}