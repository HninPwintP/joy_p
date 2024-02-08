import 'package:flutter/material.dart';
import 'package:joy_p/home_screen.dart';
import 'package:joy_p/sign_in_up_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "JoyP",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 100,
              fontFamily: 'CaveatBold',
              color: Color.fromARGB(255, 140, 61, 185),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HomeScreen();
                }));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 212, 156, 245))),
              icon: const Icon(
                Icons.people,
                size: 20.0,
              ),
              label: const Text("     Guest         "),
            ),
          ),
          //Sign In or Sign Up button
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignInUpScreen();
                }));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 212, 156, 245))),
              icon: const Icon(
                Icons.login,
                size: 20.0,
              ),
              label: const Text("SignIn/SignUp"),
            ),
          ),
        ],
      ),
    );
  }
}
