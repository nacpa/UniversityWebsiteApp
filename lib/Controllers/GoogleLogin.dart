import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Google_auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // handleAuthState() {
  //   return StreamBuilder(
  //       stream: FirebaseAuth.instance.authStateChanges(),
  //       builder: (BuildContext context, snapshot) {
  //         if (snapshot.hasData) {
  //           return AuthHome();
  //         } else {
  //           return  Login();
  //         }
  //       });
  // }

  // function to implement the google signin

// creating firebase instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {

      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
    await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
    await _auth.signInWithCredential(credential);
    final user = userCredential.additionalUserInfo?.username;
    // await Get.to(SignUp(Name: userCredential.user!.displayName??"",));
    // if(userCredential.additionalUserInfo!.isNewUser){
    //
    //   await Get.find<Auth_controller>().Login_Social(userCredential.user!.email!,
    //       userCredential.user!.displayName!, userCredential.user!.photoURL!);
    // }
    // else{
    //   // await Get.find<Auth_controller>().Login_Social(userCredential.user!.email!,
    //   //     userCredential.user!.displayName!, userCredential.user!.photoURL!);
    //
    // }

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

}
