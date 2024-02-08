import 'package:flutter/material.dart';
import 'package:groupchat02/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LogoText extends StatelessWidget {
  const LogoText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        ColorizeAnimatedText(
          'GroupChat',
          textStyle: kColorizeTextStyle,
          colors: kColorizeColors,
        ),
      ],
    );
  }
}