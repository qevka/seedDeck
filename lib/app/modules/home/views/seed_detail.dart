import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seed_deck/app/data/seed.dart';
import 'package:seed_deck/app/modules/home/controllers/home_controller.dart';

class SeedDetail extends GetView<HomeController> {
  Seed seed;

  SeedDetail({required this.seed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Get.back();
            Get.back();
          },
        ),
        title: Text(seed.name ?? "Seed Details"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Type: ${seed.seedType}"),
            Text("Name: ${seed.name}"),
            Text("GerminationRate: ${seed.germinationRate}"),
            Text("Quantity: ${seed.quantity}"),
            Text("In Garden now: ${seed.inGarden}"),
            Text("Packaged: ${seed.packagedYear}"),
          ],
        ),
      ),
    );
  }
}
