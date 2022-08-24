import 'package:eft_project/user_models/users.dart';
import 'package:eft_project/user_services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Users _currentUser;

  Users _userFromFirebaseUser(User user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  Stream<Users> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Users get currentUser => _currentUser;

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

  Future<Users> signIn(
      String email, String password) async {
    var authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return Users(uid: authResult.user.uid);
  }

  Future signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      await DatabaseService(uid: user.uid)
          .addUser(email, password);
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }
}
