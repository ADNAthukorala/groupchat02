import 'package:flutter/material.dart';

const kThemeColor01 = Color(0xFF2596BE);
const kThemeColor02 = Color(0XFF37D3A6);
const kThemeColor03 = Color(0XFF0472F8);
const kThemeColor04 = Colors.white;
const kGetStartedButtonColor = Color(0xFF2596BE);
const kLoginButtonColor = Color(0xFF2596BE);
const kLoginButtonTextColor = Colors.white;
const kRegisterButtonColor = Colors.white;
const kRegisterButtonTextColor = Color(0xFF2596BE);

const kTextFieldStyle = InputDecoration(
  hintText: 'Hint text',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: kThemeColor01,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: kThemeColor01,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kMessageTextFieldDecoration = InputDecoration(
  hintText: 'Type your message here...',
  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kColorizeColors = [
  kThemeColor01,
  kThemeColor02,
  kThemeColor03,
];

const kColorizeTextStyle = TextStyle(
  fontSize: 48.0,
  fontWeight: FontWeight.w900,
);
