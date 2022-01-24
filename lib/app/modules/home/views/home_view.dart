import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seed_deck/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.qrVIEW);
              },
              icon: Icon(Icons.camera))
        ],
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Get.toNamed(Routes.login);
          },
        ),
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
