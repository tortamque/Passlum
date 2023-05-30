import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passlum/business_logic/password_bloc.dart';
import 'package:passlum/theme/constants.dart';
import 'package:passlum/widgets/button/button.dart';
import 'package:passlum/widgets/fillers/filler.dart';
import 'package:passlum/widgets/password_field/password_field.dart';
import 'package:passlum/widgets/password_settings/password_settings_form.dart';

void main() {
  runApp(
    BlocProvider<PasswordBloc>(
      create: (context) => PasswordBloc(),
      child: PasslumApp(),
    )
  );
}

class PasslumApp extends StatelessWidget {
  const PasslumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passlum',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Passlum'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.lightBlue,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth/25
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Filler(flex: 1),

            PasswordField(),

            const Filler(flex: 1),

            const PasswordSettingsForm(),

            const Filler(flex: 1),

            Button(),
            
            const Filler(flex: 1),
          ]
        ),
      )
    );
  }
}