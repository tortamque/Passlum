import 'package:flutter/material.dart';
import 'package:passlum/enums/password_type.dart';
import 'package:passlum/theme/constants.dart';

// ignore: must_be_immutable
class RadioButton extends StatelessWidget {
  PasswordType type;
  final String title;
  final Function(PasswordType? newValue) onChanged;
  final PasswordType value;

  RadioButton({
    required this.type,
    required this.title,
    required this.onChanged,
    required this.value,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        listTileTheme: const ListTileThemeData(
          horizontalTitleGap: 0,
        ),
      ),
      child: RadioListTile<PasswordType>(
        title: Text(title),
        activeColor: CustomColors.darkBlue,
        value: value, 
        groupValue: type, 
        onChanged: onChanged
      ),
    );
  }
}