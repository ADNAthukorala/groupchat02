import 'package:flutter/material.dart';
import 'package:groupchat02/constants.dart';
import 'package:groupchat02/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groupchat02/screens/group_screen.dart';
import 'package:groupchat02/components/alert_message.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static const String id = 'registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String email;
  late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        progressIndicator: const CircularProgressIndicator(
          color: kThemeColor03,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Top logo image.
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                //Adding space between the logo image and the text field.
                const SizedBox(
                  height: 48.0,
                ),
                //Email text field.
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration:
                      kTextFieldStyle.copyWith(hintText: 'Enter your email'),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                //Adding space between email and password text fields.
                const SizedBox(
                  height: 8.0,
                ),
                //Password text field.
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration:
                      kTextFieldStyle.copyWith(hintText: 'Enter a password'),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                //Adding space between the text field and the register button.
                const SizedBox(
                  height: 24.0,
                ),
                //Register button.
                RoundedButton(
                  title: 'Register',
                  titleColor: kRegisterButtonTextColor,
                  backgroundColor: kRegisterButtonColor,
                  onPressed: () async {
                    setState(() {
                      //Once click on the register button, showSpinner is equal to true and
                      //shows the modal progress indicator.
                      showSpinner = true;
                    });
                    try {
                      //To create a new user account with a password, call the createUserWithEmailAndPassword() method.
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (context.mounted) {
                        Navigator.pushNamed(context, GroupScreen.id);
                      }
                    } on FirebaseAuthException catch (e) {
                      //When an error occurs showing an alert message.
                      showDialog(
                        context: context,
                        builder: (context) => AlertMessage(
                          title: 'Error',
                          content: e.message.toString(),
                          actionButtonTitle: 'Try Again',
                        ),
                      );
                    } catch (e) {
                      //When an error occurs showing an alert message.
                      showDialog(
                        context: context,
                        builder: (context) => const AlertMessage(
                          title: 'Error',
                          content: 'An error has occurred',
                          actionButtonTitle: 'Try Again',
                        ),
                      );
                    }
                    //After all, showSpinner is equal to false and disappears modal progress indicator.
                    setState(() {
                      showSpinner = false;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
