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
        title: Text(eventName),
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