import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  Future<void> signUp(
      {required String email,
      required String password,
      required String userName}) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    //add acc to auth
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    //add acc to store based on auth.uid as doc.id//
    await _firestore
        .collection("users")
        .doc(_auth.currentUser?.uid)
        .set({"email": email, "userName": userName});
  }

  Future<void> signIn({required String email, required String password}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      log("error: ${e.message.toString()}");
    }
  }

  Future<void> logOut() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
  }

  Future<void> SignInWithGoogle() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
    await _auth.signInWithProvider(googleAuthProvider);
  }
}
