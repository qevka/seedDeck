import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  UserCredential? user;
  //TODO: Implement LoginController

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String?> loginUser(LoginData data) async {
    return "";
    // TODO implement firebase auth here
  }

  Future<String?> signupUser(SignupData data) async {
    try {
      user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: data.name!, password: data.password!);
    } catch (e) {
      print("login failed because: $e");
    }
    print("user logged in? ${FirebaseAuth.instance.currentUser!.email}");
  }

  Future<String?> recoverPassword(String name) async {
    return "";
    // TODO implement password reset here
  }

  Future<String?> signupConfirm(String error, LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }
}
