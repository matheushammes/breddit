import 'package:breddit/Models/user.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:breddit/Models/user.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on firebase UID
  BredditUser firebaseUID(User user) {
    return user != null ? BredditUser(uid: user.uid) : null;
  }

  Stream <BredditUser> get user {
    return _auth.authStateChanges().map(firebaseUID);
  }


  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return firebaseUID(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return firebaseUID(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmail (String email, String password) async {

    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    User user = userCredential.user;
    return firebaseUID(user);}

    catch (e) {
    print(e.toString());
    return null;
    }

  }
}

