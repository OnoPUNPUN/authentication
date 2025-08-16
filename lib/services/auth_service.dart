import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // google Sign in
  signInWithGoogle() async {
    // begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtain auth details from rquest
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credential for user
    final creadential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // let's sign in

    return await FirebaseAuth.instance.signInWithCredential(creadential);
  }
}
