import 'package:flutter/material.dart';
import 'package:groupchat02/constants.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key, required this.onClick});

  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          backgroundColor: kGetStartedButtonColor,
          fixedSize: const Size.fromHeight(70.0),
        ),
        child: const Text(
          'Get Started',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
