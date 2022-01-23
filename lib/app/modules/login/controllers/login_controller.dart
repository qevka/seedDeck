import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:seed_deck/app/routes/app_pages.dart';

class LoginController extends GetxController {
  UserCredential? user;
  Rx<int> logoPosition = Rx<int>(-100);
  //TODO: Implement LoginController
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  @override
  onReady() {
    super.onReady();
    logoPosition.value = (Get.height / 2 - 300).toInt();
  }

  Future<String?> loginUser(LoginData data) async {
    try {
      user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: data.name, password: data.password);
    } catch (e) {
      return "login failed";
    }
    return "Login complete!";
  }

  Future<String?> signupUser(SignupData data) async {
    try {
      user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: data.name!, password: data.password!);
      if (FirebaseAuth.instance.currentUser != null) {
        Get.toNamed(Routes.home);
      }
    } catch (e) {
      return "login failed";
    }
    return 'User registration complete!';
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
