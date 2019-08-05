import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:racing/src/controllers/googleSignIn.dart';

class UserService extends GoogleLogin {
  Future<Null> login() async {
    if (user == null) user = await googleSignIn.signInSilently();
    if (user == null) user = await googleSignIn.signIn();
    if (await auth.currentUser() == null) {
      GoogleSignInAuthentication credentials =
          await googleSignIn.currentUser.authentication;
      await auth.signInWithCredential(
        GoogleAuthProvider.getCredential(
          idToken: credentials.idToken,
          accessToken: credentials.accessToken,
        ),
      );
    }
    user = googleSignIn.currentUser;
    notifyListeners();
  }
}
