import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passlum/business_logic/password_bloc.dart';
import 'package:passlum/models/password_generator.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
          Clipboard.setData(
          ClipboardData(
            text: PasswordGenerator().password
          )
          );
      }, 
      icon: Image.asset("assets/icons/Copy.png")
    );
  }
}

class RegenerateButton extends StatelessWidget {
  const RegenerateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        BlocProvider.of<PasswordBloc>(context).add(PasswordChangeEvent());
      }, 
      icon: Image.asset("assets/icons/Reload.png")
    );
  }
}