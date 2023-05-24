import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SizedBox.expand(
        
      )
      );
  }
}
