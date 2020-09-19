import 'package:flutter/material.dart';
import "myWidgets/myWidgets.dart";

//TODO make it collapsible, showing details for every post


class postObject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
    elevation: 5,
    child:
    Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Container(
            padding: EdgeInsets.fromLTRB(0,0,0,50),
            child:
            Image.asset("assets/images/orphic.png"),
    ),
                  Expanded(
                      child:ListView(
                          children:[
                            ListTile(
                              title: Text('Title',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                                  subtitle: Text('postTitle')),
                            Divider(),
                            ListTile(
                              title: Text('Subreddits',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                              subtitle: Text('postSubs')),]))])]));
}}

class PostHub extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<PostHub> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      add:
      postCard()
    );
  }
}

class postCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
      height: 220,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Stack(children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Stack(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(left: 5, top: 5),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                            Image.asset("assets/images/orphic.png",
                                height:100,
                                width: 100),
                              Container(
                                  padding: EdgeInsets.fromLTRB(10,0,0,80),
                                  child:
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text("Title", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                          SizedBox(height: 10),
                                          Text("Subreddits 9", style: TextStyle(color: Colors.black45)),
                                          Text("Schedule", style: TextStyle(color: Colors.black45)),
                                        ],
                                      ),)
                        ],
                      )
                ],
              ),
            )
          ]),
        ),
      ]),
    )));
  }
  }


class CardSections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
    children:[
    ListTile(
    title: Text('Title',
    style: TextStyle(fontWeight: FontWeight.w500)),
    subtitle: Text('postTitle')),
    Divider(),
    ListTile(
    title: Text('Subreddits',
    style: TextStyle(fontWeight: FontWeight.w500)),
    subtitle: Text('postSubs')),]);
  }}


