import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class _GoogleSignInController with ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  final auth = FirebaseAuth.instance;
  GoogleSignInAccount user;
}

class GoogleLogin extends _GoogleSignInController {
  GoogleSignInAccount getCurrentUser() {
    return user;
  }
}
