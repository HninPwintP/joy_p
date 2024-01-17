import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.displayLabel,
    required this.iconType,
    required this.screenWidget
  });
 
  final String displayLabel;
  final IconData iconType;
  final Widget screenWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 0, 0, 0),
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
              icon: Icon(iconType,size: 30.0,),
              label: Text(displayLabel), // <-- Text
            ),
          ),
        ],
      ),
    );
  }
}