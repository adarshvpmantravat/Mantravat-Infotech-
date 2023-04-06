import 'package:firebase_auth/firebase_auth.dart';
import 'package:jeevika_job_posting/services/database.dart';

import 'customuser.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CustomUser? _userFromFirebaseUser(User? user) {
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  //Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      // Create New User document for a user with new UID
      await DatabaseService(uid: user!.uid)
          .updateUserData('adarshvp.mantravat@gmail.com', '12345678');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
