import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seed_deck/app/data/seed.dart';
import 'package:seed_deck/app/modules/home/views/seed_detail.dart';
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
      body: ListView.builder(
        itemBuilder: (context, index) {
          return SeedCell(seed: controller.seeds[index]);
        },
        itemCount: controller.seeds.length,
      ),
    );
  }
}

class SeedCell extends GetView<HomeController> {
  final Seed seed;

  SeedCell({required this.seed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(
              () => SeedDetail(
                    seed: seed,
                  ),
              arguments: [1]);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.blueGrey,
            height: 150,
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      seed.seedType ?? "",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(seed.name ?? "")
                  ],
                ),
                Column(
                  children: [
                    Text(seed.germinationRate != null ? "Germination Rate: %${seed.germinationRate! * 100}" : ""),
                    Text("Quantity: ${seed.quantity}")
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
