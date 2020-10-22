import "package:firebase_auth/firebase_auth.dart";

class AuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static signIn({String email, String password}) async {
    try {
      final res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final User user = res.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return e.message;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return "wrong pass";
      }
    }
  }

  static signUp(String email, String password) async {
    try {
      final res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final User user = res.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
