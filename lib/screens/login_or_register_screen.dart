import 'package:flutter/material.dart';
import 'package:groupchat02/constants.dart';
import 'package:groupchat02/components/rounded_button.dart';
import 'package:groupchat02/screens/login_screen.dart';
import 'package:groupchat02/screens/registration_screen.dart';
import 'package:groupchat02/components/logo_text.dart';

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({Key? key}) : super(key: key);

  static const String id = 'login_or_register_screen';

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //Padding between main column.
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          //Main body column.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Top logo image and text.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Logo image.
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: SizedBox(
                        height: 100.0,
                        child: Image.asset('images/logo.png'),
                      ),
                    ),
                  ),
                  //Animated logo text.
                  const LogoText(),
                ],
              ),
              //Adding space between the logo and the login button.
              const SizedBox(
                height: 30.0,
              ),
              //Login button.
              RoundedButton(
                title: 'Login',
                titleColor: kLoginButtonTextColor,
                backgroundColor: kThemeColor01,
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
              //Register button.
              RoundedButton(
                title: 'Register',
                titleColor: kRegisterButtonTextColor,
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
