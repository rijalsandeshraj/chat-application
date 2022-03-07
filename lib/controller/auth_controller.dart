import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController {
  final _auth = FirebaseAuth.instance;
  late UserCredential authResult;

  Future signUpWithFirebase(email, password,
      {username, onException, onSuccess}) async {
    try {
      authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(AuthController().authResult.user!.uid)
          .set({
        'username': username,
        'email': email,
      });
    } on FirebaseAuthException catch (err) {
      onException(err);
    } catch (err) {
      onException(err);
    }
  }

  Future signInWithFirebase(email, password, {onException}) async {
    try {
      authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (err) {
      onException(err);
    } catch (err) {
      onException(err);
    }
  }

  void showError(err, ctx) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(err),
        backgroundColor: Colors.red,
      ),
    );
  }
}
