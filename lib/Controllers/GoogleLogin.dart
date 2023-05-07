import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:universitywebsiteapp/Screens/Auth/Login.dart';
import 'package:universitywebsiteapp/Screens/HomePage.dart';

String? UserName;
class Google_auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return  login();
          }
        });
  }

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
      UserName=user!.displayName;

      if (result != null) {
        print("SignUp");


      } else{
        print("SignUp   ghmggggg");
      }// if result not null we simply call the MaterialpageRoute,
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
    if(userCredential.additionalUserInfo!.isNewUser){
      UserName=userCredential.user?.displayName;
      print("SignUp");
      // await Get.find<Auth_controller>().Login_Social(userCredential.user!.email!,
      //     userCredential.user!.displayName!, userCredential.user!.photoURL!);
    }
    else{
      UserName=userCredential.user?.displayName;
      print("SignUp jmbnb");
      // await Get.find<Auth_controller>().Login_Social(userCredential.user!.email!,
      //     userCredential.user!.displayName!, userCredential.user!.photoURL!);

    }

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

}
