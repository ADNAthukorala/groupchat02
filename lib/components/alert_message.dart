import 'package:flutter/material.dart';
import 'package:groupchat02/constants.dart';

class AlertMessage extends StatelessWidget {
  const AlertMessage({super.key, required this.title, required this.content, required this.actionButtonTitle});

  final String title;
  final String content;
  final String actionButtonTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kThemeColor01,
      contentTextStyle: const TextStyle(
        color: kThemeColor04,
        fontSize: 16.0,
      ),
      titleTextStyle: const TextStyle(
        color: kThemeColor04,
        fontSize: 18.0,
        fontWeight: FontWeight.w900,
      ),
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith((states) => Colors.white10),
          ),
          child: Text(
            actionButtonTitle,
            style: const TextStyle(
              color: kThemeColor04,
            ),
          ),
        )
      ],
    );
  }
}

