import 'dart:async';
import 'package:draw/draw.dart';
import 'package:random_string/random_string.dart';

// TODO

// * Oauth
// * scraper
// * data_feeder




// * webview
oAuth(auth_code) async {
  StreamController<Subreddit> controller = StreamController();

  final reddit = Reddit.createInstalledFlowInstance(userAgent: randomAlphaNumeric(10),
      redirectUri: Uri.parse('http://breddit.io'),
      clientId: 'BfryAYGNnf2kug');

  final auth_url = reddit.auth.url(['*'], 'foobar');
  await reddit.auth.authorize(auth_code);
  print("dont lose track we b here looking 4 user handles");
  print(await reddit.user.me());
  print("and here is the refresh token");
  print(await reddit.auth.credentials.refreshToken);
  print("I dont know why you wanted that, but here are your credentials as json????");
  print(reddit.auth.credentials.toJson());
//  Stream<Subreddit> subStream = reddit.user.subreddits();
//
//  Future<dynamic> printSubs(Stream<Subreddit> stream) async {
//    await for (var value in stream) {
//      return value;
//    }
//  }
  Stream subStream = reddit.user.subreddits();
  print("you should see the subreddits here");
  subStream.listen((value){
    print(value.displayName);
  });
//  display_name is the parameter you must access and store



  }



