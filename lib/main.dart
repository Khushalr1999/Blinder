import 'package:blinder/LoginPage.dart';
import 'package:blinder/chat_screen.dart';
import 'package:blinder/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Blinder());
}

class Blinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        SignUp.id: (context) => SignUp(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
