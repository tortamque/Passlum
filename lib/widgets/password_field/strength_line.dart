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
        builder: (context, state) {
          return _buildStrengthLine(context, state);
        },
      ),
    );
  }
}


Widget _buildStrengthLine(BuildContext context, String state) {
  Strength passwordStrength = _checkPasswordStrength(state);

  double widthFraction;
  if (passwordStrength == Strength.weak) {
    widthFraction = 1 / 3;
  } else if (passwordStrength == Strength.medium) {
    widthFraction = 2 / 3;
  } else {
    widthFraction = 1.0;
  }

  return AnimatedContainer(
    duration: const Duration(milliseconds: 250),
    curve: Curves.easeInOut,
    margin: const EdgeInsets.all(0),
    decoration: BoxDecoration(
      color: _getStrengthLineColor(passwordStrength),
      borderRadius: _getStrengthLineBorderRadius(passwordStrength),
    ),
    width: MediaQuery.of(context).size.width * widthFraction,
  );
}

Color _getStrengthLineColor(Strength passwordStrength) {
  if (passwordStrength == Strength.strong) {
    return CustomColors.strengthLineGreen;
  } else if (passwordStrength == Strength.medium) {
    return CustomColors.strengthLineYellow;
  } else {
    return CustomColors.strengthLineRed;
  }
}

BorderRadius _getStrengthLineBorderRadius(Strength passwordStrength) {
  return passwordStrength == Strength.strong
      ? const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        )
      : const BorderRadius.all(Radius.circular(10));
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

  if (uppercaseCount >= 2 && numberCount >= 1 && specialCharCount >= 1 && password.length >= 12) {
    return Strength.strong;
  } else if (((uppercaseCount >= 2 && numberCount >= 1) || specialCharCount >= 1) && password.length >= 8) {
    return Strength.medium;
  } else {
    return Strength.weak;
  }
}
