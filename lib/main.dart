import 'package:flutter/material.dart';
import 'package:joy_p/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //This widget is ther root of app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 24, 107, 8),
                Color.fromARGB(255, 70, 223, 134),
                Color.fromARGB(255, 169, 220, 185)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),
          child: const HomeScreen(),
      ),
    ) 
    );
  }
}