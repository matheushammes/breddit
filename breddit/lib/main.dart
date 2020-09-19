import 'package:breddit/Services/auth.dart';
import 'package:breddit/pages/Home.dart';
import 'package:breddit/pages/Loading.dart';
import 'package:breddit/pages/PostHub.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:breddit/pages/Wrapper.dart';
import 'package:provider/provider.dart';
import "package:breddit/Models/user.dart";




void main() => runApp(MyApp());
// FORMS https://github.com/vcardona/Flutter-Login-Page-UI-Explained/blob/master/README.md
// reveal stuff AnimatedPositioned


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<BredditUser>.value(
            value: AuthService().user,
            child: MaterialApp(
              home: Wrapper()),

//            ADD LOADING SCREEN AS RETURN

      );}
        return Loading();});

  }
  }
