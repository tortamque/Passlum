import 'package:flutter/material.dart';
import 'package:passlum/widgets/fillers/filler.dart';
import 'package:passlum/widgets/password_settings/password_customization_form/password_customization_form.dart';
import 'package:passlum/widgets/password_settings/password_lenght_form/password_lenght_form.dart';
import 'package:passlum/widgets/password_settings/form_title.dart';

class PasswordSettingsForm extends StatelessWidget {
  const PasswordSettingsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 15,
      child: Card(
        elevation: 10,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          children: [            
            FormTitle(),

            Filler(flex: 1),

            PasswordLenght(),

            Filler(flex: 1),

            PasswordCustomizationForm()
          ],
        ),
      )
    );
  }
}