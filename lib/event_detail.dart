import 'package:flutter/material.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({
    super.key,
    required this.eventName
  });

  final String eventName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 140, 61, 185),
        title: Text(
          eventName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: 'CaveatBold',
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: []
        ),
      ),
    );
  }
}
