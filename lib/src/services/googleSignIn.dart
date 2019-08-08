import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class _GoogleSignInServiceBase with ChangeNotifier {
  final _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;
  GoogleSignInAccount _user;
}

class GoogleLogin extends _GoogleSignInServiceBase {
  GoogleSignInAccount getCurrentUser() {
    return _user;
  }
}

class UserService extends GoogleLogin {
  Future<Null> login() async {
    if (_user == null) _user = await _googleSignIn.signInSilently();
    if (_user == null) _user = await _googleSignIn.signIn();
    if (await _auth.currentUser() == null) {
      GoogleSignInAuthentication credentials =
          await _googleSignIn.currentUser.authentication;
      await _auth.signInWithCredential(
        GoogleAuthProvider.getCredential(
          idToken: credentials.idToken,
          accessToken: credentials.accessToken,
        ),
      );
    }
    _user = _googleSignIn.currentUser;
    notifyListeners();
  }

  Future<Null> logout() async {
    if (_user != null) {
      await _googleSignIn.signOut();
      _user = null;
      notifyListeners();
    }
  }
}
