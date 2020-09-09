import 'package:flutter/material.dart';
import "myWidgets/myWidgets.dart";


class Loading extends StatelessWidget {
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
              Container(
                  child:
                  MyButton(
                      child: const Text('LOADING', style: TextStyle(fontSize: 20))))]
        ),
      ),
    );
  }
}
