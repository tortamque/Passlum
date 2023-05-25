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
            Expanded(
              flex: 1,
              child: Container(
                height: 200,
              ),
            ),
            Expanded(
              flex: 3,
              child: Card(
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
                            Expanded(
                              flex: 5,
                              child: Text(
                                _password,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                onPressed: (){}, 
                                icon: Image.asset("assets/icons/Copy.png")
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                onPressed: (){}, 
                                icon: Image.asset("assets/icons/Reload.png")
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        margin: EdgeInsets.all(0),
                        color: Colors.red,
                        child: SizedBox(
                          width: double.infinity,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                        ),
                      ),
                    )
                  ],
                )
              )
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
