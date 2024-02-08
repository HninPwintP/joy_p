import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton(
      {super.key,
      required this.displayLabel,
      required this.iconType,
      required this.screenWidget});

  final String displayLabel;
  final IconData iconType;
  final Widget screenWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: RadialGradient(colors: [
        Color.fromARGB(255, 146, 145, 145),
        Color.fromARGB(255, 192, 190, 190),
        Color.fromARGB(255, 223, 221, 221),
      ], center: Alignment.center, radius: 1)),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //log out button
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return screenWidget;
                }));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 212, 156, 245))),
              icon: Icon(
                iconType,
                size: 20.0,
              ),
              label: Text(displayLabel), // <-- Text
            ),
          ),
        ],
      ),
    );
  }
}
