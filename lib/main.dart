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
            Expanded(
              flex: 1,
              child: Container(
                height: 200,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 200,
                color: Colors.blue[800],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 200,
              ),
            ),
            Expanded(
              flex: 12,
              child: Container(
                height: 200,
                color: Colors.red[800],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 200,
              ),
            ),
            TextButton(
              onPressed: (){},
              child: Text("Copy password"),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 200,
              ),
            ),
          ]
        ),
      )
    );
  }
}
