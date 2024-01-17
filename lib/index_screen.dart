import 'package:flutter/material.dart';
import 'package:joy_p/home_screen.dart';
import 'package:joy_p/sign_in_up_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

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
          Image.asset(
            'assets/images/DSCF5024.png',
            width: 300,),
            const SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                },
                icon: const Icon(
                  Icons.person,
                  size: 30.0,
                ),
                label: const Text("Guest"), 
              ),
            ),
            const SizedBox(height: 30,),
            //Sign In or Sign Up button
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignInUpScreen();
                  }));
                },
                icon: const Icon(
                  Icons.login,
                  size: 30.0,
                ),
                label: const Text("SignIn/SignUp"),
              ),
            ),
            ],

      ),
    );
  }
}
