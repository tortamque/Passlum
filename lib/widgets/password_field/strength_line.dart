import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passlum/business_logic/password_bloc.dart';
import 'package:passlum/enums/password_type.dart';
import 'package:passlum/theme/constants.dart';

class StrenghtLine extends StatefulWidget {
  final int flex;

  const StrenghtLine({
    required this.flex,
    super.key
  });

  @override
  State<StrenghtLine> createState() => _StrenghtLineState();
}

class _StrenghtLineState extends State<StrenghtLine> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: BlocBuilder<PasswordBloc, String>(
        builder: (context, state){
          Strength passwordStrength = _checkPasswordStrength(state);
          print("$state : $passwordStrength");

          return Card(
            margin: EdgeInsets.all(0),
            color: (){
              if(passwordStrength == Strength.strong) {
                return CustomColors.strengthLineGreen;
              } else if (passwordStrength == Strength.medium) {
                return CustomColors.strengthLineYellow;
              } else {
                return CustomColors.strengthLineRed;
              }
            }(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            ),
            child: SizedBox(
              width: double.infinity,
            ),
          );
        }
      ),
    );
  }
}

Strength _checkPasswordStrength(String password) {
  int uppercaseCount = 0;
  int numberCount = 0;
  int specialCharCount = 0;

  for (int i = 0; i < password.length; i++) {
    if (num.tryParse(password[i]) != null) {
      numberCount++;
    } else if ('!@#\$%^&*()_-+=/?'.contains(password[i])) {
      specialCharCount++;
    } if (password[i].toUpperCase() == password[i]) {
      uppercaseCount++;
    }
  }

  if (uppercaseCount >= 2 && numberCount >= 2 && specialCharCount >= 1) {
    return Strength.strong;
  } else if (uppercaseCount >= 2 && numberCount >= 1) {
    return Strength.medium;
  } else {
    return Strength.weak;
  }
}
