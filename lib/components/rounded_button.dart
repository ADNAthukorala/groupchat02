import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
        required this.title,
        required this.titleColor,
        required this.backgroundColor,
        required this.onPressed});

  final String title;
  final Color? titleColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(50.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            color: titleColor,
          ),
        ),
      ),
    );
  }
}
