import 'package:flutter/material.dart';
import 'package:groupchat02/components/get_started_button.dart';
import 'package:groupchat02/components/logo_text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //Main body column.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Top logo image and text.
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Logo image.
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 150.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  //Animated logo text.
                  const LogoText(),
                ],
              ),
            ),
            //Bottom panel.
            Expanded(
              child: Material(
                elevation: 10.0,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0)),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 40.0, left: 40.0, right: 40.0, bottom: 20.0),
                    //Main panel column.
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Main panel top texts holder.
                        Column(
                          children: const [
                            //Top text.
                            Text(
                              'Enjoy the new experience of chatting with global friends',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            //The space between top text and bottom text.
                            SizedBox(
                              height: 20.0,
                            ),
                            //Bottom text
                            Text(
                              'Connect people around the world for free',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        //Main panel Get Started button.
                        GetStartedButton(
                          onClick: () {
                            Navigator.pushNamed(
                                context, 'login_or_register_screen');
                          },
                        ),
                        //Main panel bottom text.
                        const Text(
                          'Powered by ADNA',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
