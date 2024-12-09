import 'package:flutter/material.dart';

class DisplayWidget extends StatelessWidget {
  final String output;

  DisplayWidget({required this.output});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.black,
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(20),
        child: Text(
          output,
          style: const TextStyle(fontSize: 48, color: Color.fromARGB(255, 4, 255, 25)),
        ),
      ),
    );
  }
}
