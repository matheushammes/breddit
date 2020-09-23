import 'package:breddit/pages/SignIn.dart';
import 'package:breddit/pages/Register.dart';
import 'package:flutter/material.dart';

// this class acts as an late wrapper, guiding the user to the right page,
// using sign in as a bool
// TODO adding a register checker should be the next step

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView:  toggleView);
    } else {
      return Register(toggleView:  toggleView);
    }
  }
}