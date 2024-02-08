import 'package:flutter/material.dart';
import 'package:groupchat02/constants.dart';

class SendButton extends StatelessWidget {
  const SendButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: kThemeColor01,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20.0),
      ),
      child: const Icon(
        Icons.send,
      ),
    );
  }
}