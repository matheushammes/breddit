import 'package:meta/meta.dart';
// accessToken will constantly be redefined thus it cant and shouldnt be required.
// ###########
// "store device id in firebase database and every time you sing in using anonymous
// sign in method, you can retrieve the same data. i don't think firebase let's us use same
// anonymous user id to use again and again right now."

// the workaround could be saving the reddit username and device ID using those as identifiers.
class BredditUser{
  final String uid, username, refreshToken, accessToken;

  String getUID() {
    return uid;
  }

  String getUsername() {
    return username;
  }

  String getRefreshToken() {
    return refreshToken;
  }

  String getAccessToken() {
    return accessToken;
  }


  BredditUser({
    @required this.uid,
    @required this.username,
    @required this.refreshToken,
    this.accessToken,
  });


}