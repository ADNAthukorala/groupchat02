import 'package:flutter/material.dart';
import 'package:groupchat02/constants.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {super.key,
      required this.sender,
      required this.message,
      required this.isMe});

  final String sender;
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(
              color: Colors.black38,
              fontSize: 12.0,
            ),
          ),
          Material(
            elevation: 5.0,
            color: isMe ? kThemeColor01 : kThemeColor04,
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))
                : const BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                message,
                style: isMe ? const TextStyle(
                  color: kThemeColor04,
                ) : const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
