import 'package:blinder/chat_screen.dart';
import 'package:blinder/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xfff2f8fd),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                ),
                width: 50,
                height: 69,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '    Email Address',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32),
                          ),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(32),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                ),
                width: 50,
                height: 69,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '    Password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32),
                          ),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(32),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30),
                  child: MaterialButton(
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    minWidth: 200,
                    height: 42,
                    child: Text(
                      'Log in',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUp.id);
                    },
                    minWidth: 200,
                    height: 42,
                    child: Text(
                      'Register',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
