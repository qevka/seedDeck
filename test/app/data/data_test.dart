import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:seed_deck/app/data/seed.dart';

void main() {
  group("app folder, data class", () {
    final seedData = File('assets/data/data.json');
    //List<dynamic> seedJsonList;
    test("Seed class test", () async {
      final seedJson = jsonDecode(await seedData.readAsString());
      var seed = Seed.fromJson(seedJson[7]);
      var seedResult = seed.toJson();
      expect(seedJson[7], seedResult);
    });
  });
}
