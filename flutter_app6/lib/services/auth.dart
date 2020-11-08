import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app6/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // sign in anon
  // 非同期処理　Future async await
  // Future signInAnon() async {
  //   try {
  //     // AutoResult => Error! UserCredential => OK!
  //     UserCredential result = await _auth.signInAnonymously();
  //     //FirebaseUser => deprecated! FirebaseFirestore => Error! User => OK!
  //     User user = result.user;
  //     return user;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
  MyUser _userFromFirebaseUser(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      // 認証フローをトリガーする
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      // リクエストから認証の詳細を取得する
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      // 新しい資格情報を作成する
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // サインインしたら、UserCredentialを返す
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password

  // register with email & password

  // sign out

}
