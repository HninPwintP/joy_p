import 'package:flutter/material.dart';
import 'package:joy_p/home_screen.dart';
import 'package:joy_p/main.dart';

//SignIn.SignUpScreen
class SignInUpScreen extends StatefulWidget {
  const SignInUpScreen({Key? key}) : super(key: key);

  @override
  State<SignInUpScreen> createState() => SignInUpScreenState();
}

class SignInUpScreenState extends State<SignInUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JoyP'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //SignIn button
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                },
                icon: Icon(
                  // <-- Icon
                  Icons.login,
                  size: 30.0,
                ),
                label: Text("      Sign In        "), // <-- Text
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
                icon: Icon(
                  // <-- Icon
                  Icons.login,
                  size: 30.0,
                ),
                label: Text("      Sign Up        "), // <-- Text
              ),
            ),

            //Back button
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MyApp();
                  }));
                },
                icon: Icon(
                  // <-- Icon
                  Icons.home,
                  size: 30.0,
                ),
                label: Text("       Back         "), // <-- Text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
