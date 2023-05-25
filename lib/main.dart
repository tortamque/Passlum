import 'package:flutter/material.dart';
import 'package:passlum/widgets/fillers/filler.dart';
import 'package:passlum/widgets/password_field/password_field.dart';


void main() {
  runApp(const PasslumApp());
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
  String _password = "password";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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

            PasswordField(
              password: _password
            ),

            const Filler(flex: 1),

            Expanded(
              flex: 12,
              child: Container(
                height: 200,
                color: Colors.red[800],
              ),
            ),

            const Filler(flex: 1),

            TextButton(
              onPressed: (){},
              child: Text("Copy password"),
            ),
            
            const Filler(flex: 1),
          ]
        ),
      )
    );
  }
}
