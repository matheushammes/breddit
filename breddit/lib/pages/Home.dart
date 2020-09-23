import 'package:breddit/pages/Register.dart';
import 'package:breddit/pages/SignIn.dart';
import 'package:flutter/material.dart';
import "myWidgets/myWidgets.dart";
import "package:breddit/Services/auth.dart";

class HomemadeSourdough extends StatefulWidget {
  @override
  _HomemadeSourdoughState createState() => _HomemadeSourdoughState();
}

class _HomemadeSourdoughState extends State<HomemadeSourdough> {

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        add:
        Center(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(0,0,0,50),
                    child:
                    Image.asset("assets/images/breadmate.png")),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                      [
                  MyButton(onClicked: () {Navigator.push(context,  MaterialPageRoute(builder: (context) => SignIn()
                  ));} ,
                      child: const Text('Log In', style: TextStyle(fontSize: 20))),
    MyButton(onClicked: () {Navigator.push(context,  MaterialPageRoute(builder: (context) => Register()
    ));} ,
    child: const Text('Register', style: TextStyle(fontSize: 20)))])])
            ),
        );
  }
}

class HomeLoggedIn extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
      return MyScaffold(
          add:
          Center(
              child:
              Container(
                  padding: EdgeInsets.fromLTRB(0,0,0,50),
                  child:
                  MyButton(onClicked: () async {await _auth.signOut();} ,
                      child: const Text('Log out', style: TextStyle(fontSize: 20))),)));}}


