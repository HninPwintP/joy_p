import 'package:flutter/material.dart';
import 'package:joy_p/index_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //This widget is the root of app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
          Color.fromARGB(255, 146, 145, 145),
          Color.fromARGB(255, 192, 190, 190),
          Color.fromARGB(255, 223, 221, 221),
        ], center: Alignment.center, radius: 1)),
        //child: const HomeScreen(),
        child: const IndexScreen(),
      ),
    ));
  }
}
