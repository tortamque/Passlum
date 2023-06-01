import 'package:flutter/material.dart';
import 'package:passlum/models/password_lenght.dart';
import 'package:passlum/widgets/password_settings/password_lenght_form/lenght_card.dart';
import 'package:passlum/widgets/password_settings/password_lenght_form/slider.dart';
import 'package:passlum/widgets/password_settings/password_lenght_form/subtitle.dart';

class PasswordLenght extends StatefulWidget {
  const PasswordLenght({super.key});

  @override
  State<PasswordLenght> createState() => _PasswordLenghtState();
}

class _PasswordLenghtState extends State<PasswordLenght> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PasswordLenghtSubtitle(),
              Row(
                children: [
                  PasswordLenghtCard(
                    passwordLenght: PasswordLength().passwordLength
                  ),
                  PasswordLenghtSlider(
                    onSliderChanged: (){
                      setState(() {
                        
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      );
  }
}