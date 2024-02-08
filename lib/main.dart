import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groupchat02/screens/welcome_screen.dart';
import 'package:groupchat02/screens/login_or_register_screen.dart.';
import 'package:groupchat02/screens/login_screen.dart';
import 'package:groupchat02/screens/registration_screen.dart';
import 'package:groupchat02/screens/group_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  String getTheOpenPage() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return GroupScreen.id;
    } else {
      return WelcomeScreen.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: getTheOpenPage(),
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginOrRegisterScreen.id: (context) => const LoginOrRegisterScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        GroupScreen.id: (context) => const GroupScreen(),
      },
    );
  }
}
