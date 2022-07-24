import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_color_note/page/sign_up.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth;

  AuthServices(this._firebaseAuth);

  get context => new signUpPage();

  // Future<bool> signIn(
  //     {required String email,
  //     required String username,
  //     required String password}) async {
  //   try {
  //     await _firebaseAuth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     return true;
  //   } on FirebaseAuthException catch (e) {
  //     debugPrint(e.message ?? "Unknown Error");
  //     return false;
  //   }
  // }

  // Future<bool> signUp(
  //     {required String email,
  //     required String username,
  //     required String password}) async {
  //   try {
  //     await _firebaseAuth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             content: Text("Akun telah dibuat :)"),
  //           );
  //         });
  //     return true;
  //   } on FirebaseAuthException catch (e) {
  //     debugPrint(e.message ?? "Unknown Error");
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             content: Text(e.message.toString()),
  //           );
  //         });
  //     return false;
  //   }
  // }
}
