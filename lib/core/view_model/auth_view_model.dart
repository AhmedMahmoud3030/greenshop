import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:greenshop/view/home_view.dart';

class AuthViewModel extends GetxController {
  final _googleSignIn = GoogleSignIn(scopes: ['email']);
  final facebookLogin = FacebookLogin();
  final _auth = FirebaseAuth.instance;
  String email, password, username;

  Rxn<User> _user = Rxn<User>();

 String get user {
    return _user.value?.email;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    final googleAuth = await googleUser.authentication;
    final googleCredential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    await _auth.signInWithCredential(googleCredential);
  }

  void facebookSignInMethod() async {
    final result =
        await facebookLogin.logIn(permissions: [FacebookPermission.email]);
    final faceAccessToken = result.accessToken;
    final faceCredential =
        FacebookAuthProvider.credential(faceAccessToken.token);

    await _auth.signInWithCredential(faceCredential);
  }

  void emailSignInMethod() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomeView());
    } catch (err) {
      Get.snackbar('Error login account', err.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
