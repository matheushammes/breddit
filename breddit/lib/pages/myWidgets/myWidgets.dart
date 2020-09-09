import 'package:breddit/pages/Home.dart';
import 'package:breddit/pages/Wrapper.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import "package:firebase_core/firebase_core.dart";
import 'dart:async';
import 'functions.dart';
import "package:breddit/Services/auth.dart";

// TODO:
// post manager: redditor.remaining;
//               redditor.subreddits;
//               List of posts;
//               schedule;
//               selected;
//               List of maps: titles, subreddits, ids, Post objects;

class PostManager{
  final int postsUsed;
  final List postObjects, schedule;

  PostManager({
    this.postsUsed,
    this.postObjects,
    this.schedule,
  });
}



class MyScaffold extends StatelessWidget {
  final Widget add;

  MyScaffold({this.add});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
            appBar:
            AppBar(title: Text('Bread.It'), backgroundColor: Colors.greenAccent[400]),
            body: Container(
              color: Colors.amber[50],
              child:add,
            )));
  }
}
// scaffold widget t
Widget scaffode = MyScaffold();

class MyButton extends RaisedButton {
  const MyButton({this.onClicked, this.child})
      : super(onPressed: onClicked, elevation: 0.0, child: child);

  final VoidCallback onClicked;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.greenAccent[400],
        textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(side: const BorderSide(
            color: Colors.white,
            width: 1.0,
            style: BorderStyle.solid,
          ),
            borderRadius: BorderRadius.circular(30),
          ),)
        ,),
      child: Builder(builder: super.build),);
  }
}
// formatted button
Widget webutton = MyButton();


class WebViewGO extends StatefulWidget {
  @override
  _WebViewGO createState() => _WebViewGO();
}

class _WebViewGO extends State<WebViewGO> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        add:
        WebView(
          initialUrl: 'https://www.reddit.com/api/v1/authorize.compact?response_type=code&client_id=BfryAYGNnf2kug&redirect_uri=http%3A%2F%2Fbreddit.io&code_challenge=x1zSohlkB0cuIE51t-bu0ucqKUSVZU1PBUuMmokZXv8&code_challenge_method=S256&state=permanent&scope=submit+identity+modflair+mysubreddits+modposts+modflair+wikiread&duration=permanent',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
          },

          navigationDelegate: (NavigationRequest request) async {
            if (request.url.startsWith('http://breddit.io/')) {
              var url = request.url;
              RegExp exp = new RegExp(r"(?<=code=).*");
              Match firstMatch = exp.firstMatch(url);
//            gets the code from the breddit url
              var auth_code = url.substring(firstMatch.start, firstMatch.end);
              print(auth_code);
//            calling the oauth function
              oAuth(auth_code);
              dynamic result = await _auth.signInAnon();
              print("we made it in here");
              print(result.uid);



              return Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Wrapper()),
              );
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
                  )
    );
  }
}


