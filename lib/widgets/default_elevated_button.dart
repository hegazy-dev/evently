import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  String label;
  VoidCallback onPressed;

  DefaultElevatedButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.sizeOf(context).width, 48),
      ),
      child: Text(label),
    );
  }
}
