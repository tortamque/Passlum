import 'package:flutter/material.dart';
import 'package:passlum/theme/constants.dart';
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
  int _passwordLenght = 12;

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
              child: Card(
                elevation: 10,
                surfaceTintColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [            
                    const Text(
                      "Customize your password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26
                      ),
                    ),

                  Filler(flex: 1),

                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Password lenght",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17
                              ),
                            ),
                            Row(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                         BoxShadow(
                                          color: Colors.grey,
                                        ),
                                        BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: -0.01,
                                          blurRadius: 3,
                                        ),
                                      ]
                                    ),
                                    width: 80,
                                    height: 40,
                                    child: Center(child: Text(
                                      _passwordLenght.toString(), 
                                      style: const TextStyle(
                                        fontSize: 16
                                      ),
                                    )),
                                  ),
                                ),
                                Expanded(
                                  child: SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      showValueIndicator: ShowValueIndicator.never,
                                      thumbColor: CustomColors.darkBlue,
                                      activeTrackColor: CustomColors.lightBlue,
                                      trackHeight: 9,
                                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
                                      tickMarkShape: SliderTickMarkShape.noTickMark, 
                                    ),
                                    child: Slider(
                                      value: _passwordLenght.toDouble(), 
                                      min: 6,
                                      max: 20,
                                      divisions: 14,
                                      label: _passwordLenght.round().toString(),
                                      onChanged: (double newValue){
                                        setState(() {
                                          _passwordLenght = newValue.toInt();
                                        });
                                      },
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              )
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
