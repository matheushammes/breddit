//import 'dart:async';
//import 'package:draw/draw.dart';
//import 'package:random_string/random_string.dart';
//
//// TODO
//
//// * Oauth
//// * scraper
//// * data_feeder
//
//
//
//
//// * webview
//oAuth(auth_code) async {
//  StreamController<Subreddit> controller = StreamController();
//
//  final reddit = Reddit.createInstalledFlowInstance(userAgent: randomAlphaNumeric(10),
//      redirectUri: Uri.parse('http://breddit.io'),
//      clientId: 'BfryAYGNnf2kug');
//
//  final auth_url = reddit.auth.url(['*'], 'foobar');
//  await reddit.auth.authorize(auth_code);
//  print("dont lose track we b here looking 4 user handles");
//  print(await reddit.user.me());
//  print("and here is the refresh token");
//  print(await reddit.auth.credentials.refreshToken);
//  print("I dont know why you wanted that, but here are your credentials as json????");
//  print(reddit.auth.credentials.toJson());
////  Stream<Subreddit> subStream = reddit.user.subreddits();
////
////  Future<dynamic> printSubs(Stream<Subreddit> stream) async {
////    await for (var value in stream) {
////      return value;
////    }
////  }
//  Stream subStream = reddit.user.subreddits();
//  print("you should see the subreddits here");
//  subStream.listen((value){
//    print(value.displayName);
//  });
////  display_name is the parameter you must access and store
//
//
//
//  }
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draw/draw.dart';
import 'package:breddit/Models/user.dart';
import 'package:random_string/random_string.dart';
import 'package:provider/provider.dart';

Future<void> oAuth(auth_code, uid) async {
  StreamController<Subreddit> controller = StreamController();
  final reddit = Reddit.createInstalledFlowInstance(
      userAgent: randomAlphaNumeric(10),
      redirectUri: Uri.parse('http://breddit.io'),
      clientId: 'BfryAYGNnf2kug');

  reddit.auth.url(['*'], 'foobar');
  await reddit.auth.authorize(auth_code);
  //print(reddit.auth.credentials.toJson());
  String accessToken = reddit.auth.credentials.accessToken;
  print('accessToken: ' + accessToken);
  String refreshToken = reddit.auth.credentials.refreshToken;
  print('refreshToken: ' + refreshToken);
  Redditor currentUser = await reddit.user.me();
  print('redditId: ' + currentUser.id);
  print('username: ' + currentUser.displayName);
  Map<String, dynamic> data = currentUser.data;
  print('subreddit: ' + data['subreddit'].toString());

  saveUserFirebase(uid, accessToken, refreshToken, currentUser.id,
      currentUser.displayName, data['subreddit']);
}

Future saveUserFirebase(String uid, String accessToken, String refreshToken,
    String redditId, String username, Map<String, dynamic> subreddit) async {
  await FirebaseFirestore.instance.collection('users').doc(redditId).set({
    'uid': uid,
    'accessToken': accessToken,
    'refreshToken': refreshToken,
    'redditId': redditId,
    'username': username,
    'subreddit': subreddit
  });

  print('saveUserFirebase');
  loadUserFirebase(uid);
}

Future loadUserFirebase(String uid) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .get()
      .then((DocumentSnapshot snap) {
        print(snap.data()['uid']);
    print(snap.data()['accessToken']);
    print(snap.data()['refreshToken']);
    print(snap.data()['redditId']);
    print(snap.data()['username']);
    print(snap.data()['subreddit']);
  });

  print('loadUserFirebase');
}





