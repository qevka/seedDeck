import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:seed_deck/app/modules/login/controllers/login_controller.dart';
import 'package:seed_deck/app/routes/app_pages.dart';

class LoginView extends GetView<LoginController> {
  static const routeName = '/auth';

  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: "Seed Deck",
      titleTag: "title",
      navigateBackAfterRecovery: true,
      onConfirmRecover: controller.signupConfirm,
      loginAfterSignUp: true,
      initialAuthMode: AuthMode.login,
      userValidator: (value) {
        if (!value!.contains('@') || !value.endsWith('.com')) {
          return "Email must contain '@' and end with '.com'";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value!.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },
      onLogin: (loginData) {
        return controller.loginUser(loginData);
      },
      onSignup: (signupData) {
        signupData.additionalSignupData?.forEach((key, value) {
          debugPrint('$key: $value');
        });
        if (signupData.termsOfService.isNotEmpty) {
          for (var element in signupData.termsOfService) {
            debugPrint(' - ${element.term.id}: ${element.accepted == true ? 'accepted' : 'rejected'}');
          }
        }
        return controller.signupUser(signupData);
      },
      onSubmitAnimationCompleted: () {
        Get.toNamed(Routes.home);
      },
      onRecoverPassword: (name) {
        return controller.recoverPassword(name);
        // Show new password dialog
      },
    );
  }
}
