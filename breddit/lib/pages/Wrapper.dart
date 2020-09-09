import 'package:breddit/Models/user.dart';
import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:provider/provider.dart';
import 'Home.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<BredditUser>(context);
    if (user == null){
      return HomemadeSourdough();
    }
    else {
      return HomeLoggedIn();
    }}
  }

