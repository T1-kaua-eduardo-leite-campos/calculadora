import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Color color;
  final bool isLarge;
  final void Function(String) onTap;

  ButtonWidget(this.label, this.color, {this.isLarge = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isLarge ? 2 : 1,
      child: ElevatedButton(
        onPressed: () => onTap(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
