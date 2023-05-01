import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/services/database.dart';
import 'package:firebase_project/usermodel.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<MyUser?> get user {
    return _auth
    .authStateChanges().map(_userFromFirebaseUser(user as User) as MyUser? Function(User? event));
  }

  UserCredentials? _userFromFirebaseUser(User user) {
    return user != null ? UserCredentials(uid: user.uid) : null;
  }

  Future<User?> signInEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User?> registerEmailandPassword(String firstName,String lastName,String email,String password) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    DataBase(uid: result.user?.uid).updateUserData(firstName, lastName);
    User? user = result.user;
    return user;
  }
}
