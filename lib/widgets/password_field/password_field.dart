import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passlum/business_logic/password_bloc.dart';
import 'package:passlum/models/password_generator.dart';
import 'package:passlum/widgets/password_field/password_text.dart';
import 'package:passlum/widgets/password_field/strength_line.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      flex: 3,
      child: Card(
        elevation: 10,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth/30
                ),
                child: Row(
                  children: [
                    BlocBuilder<PasswordBloc, String>(
                      builder: (context, state){
                        return PasswordText(
                          flex: 1,
                          text: state,
                        );
                      },
                    ),
                    IconButton(
                      onPressed: (){
                         Clipboard.setData(
                          ClipboardData(
                            text: PasswordGenerator().password
                          )
                         );
                      }, 
                      icon: Image.asset("assets/icons/Copy.png")
                    ),
                    IconButton(
                      onPressed: (){}, 
                      icon: Image.asset("assets/icons/Reload.png")
                    ),
                  ],
                ),
              ),
            ),
            const StrenghtLine(flex: 1)
          ],
        )
      )
    );
  }
}