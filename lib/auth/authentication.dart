// ignore_for_file: avoid_print

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Future<String> login(String email, String password) async {
  //   final User? user = (await _firebaseAuth.signInWithEmailAndPassword(
  //           email: email, password: password))
  //       .user;
  //
  //   return user!.uid;
  // }

  Future<void> authorizationUser(String email, String password) async {
    try {
      final User? user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "firebase_auth/wrong-password") {
        print('Ошибка - wrong-password');
      } else if (e.code == 'firebase_auth/user-not-found') {
        print('Ошибка - user-not-found');
      }
    } catch (e) {
      print(e);
    }
  }

  // Future<String> signUp(String email, String password) async {
  //   final User? user = (await _firebaseAuth.createUserWithEmailAndPassword(
  //           email: email, password: password))
  //       .user;
  //   print("Создание нового юзера");
  //   print(user?.uid.toString());
  //
  //   return user!.uid;
  // }

  Future<void> registrationNewUser(String email, String password) async {
    try {
      final User? user = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      print("Новый пользователь создан");
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        //getIsEmailAlreadyInUse();

        print('Ошибка - The account already exists for that email.');
      } else if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      }
    } catch (e) {
      print(e);
    }
  }

  //разлогиниться
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  //текущий user
  Future<User?> getUser() async {
    final User? user = _firebaseAuth.currentUser;
    return user;
  }

  //восстановить пароль по почте
  Future<void> getForgotPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
