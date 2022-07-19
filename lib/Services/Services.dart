import 'package:firebase_auth/firebase_auth.dart';
import 'package:styliste/Users/User.dart';

class UserService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<StylisteUser> get user {
    return _auth
        .authStateChanges()
        .asyncMap((user) => StylisteUser(email: user!.email, uid: user.uid));
  }

  Future<StylisteUser> auth(StylisteUser stylisteUser) async {
    UserCredential userCredential;
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
          email: stylisteUser.email.toString(),
          password: stylisteUser.password.toString());
    } catch (e) {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: stylisteUser.email.toString(),
          password: stylisteUser.password.toString());
    }

    stylisteUser.SetUid = userCredential.user!.uid;
    // stylisteUser.SetSociety = userCredential.additionalUserInfo!.profile;

    return stylisteUser;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}

// // // Future<void> check(StylisteUser stylisteUser) async {
// // //   UserCredential userCredential;
// // //   final String checking;
// // //   checking = _auth.fetchSignInMethodsForEmail(stylisteUser.email);
// // // }
