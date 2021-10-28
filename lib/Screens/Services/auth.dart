import 'package:firebase_auth/firebase_auth.dart';
import 'package:lavajava/Models/User.dart';
import 'package:lavajava/Screens/Services/database.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//create user obj based on firebaseuser
  UserLV _userFromFirebeseUser(User user) {
    return user != null ? UserLV(uid: user.uid) : null;
  }

//auth change user stream
  Stream<UserLV> get user {
    return _auth.authStateChanges().map(_userFromFirebeseUser);
  }

//sign in anon
  // Future signInAnon() async {
  //   try {
  //     AuthResult result = await _auth.signInAnonymously();
  //     FirebaseUser user = result.user;
  //     return _userFromFirebeseUser(user);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

//sign in with email and pasward
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebeseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//register with email and passward
  Future registerWithEmailAndPassword(String email, String password,
      String name, String address, String mobileNo) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      //create a new doccument to user with uid
      await DatabaseService(uid: user.uid)
          .updateCustomerData(user.uid, name, address, mobileNo);
      return _userFromFirebeseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//logout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
