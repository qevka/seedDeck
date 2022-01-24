import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:seed_deck/app/data/seed.dart';

class FirestoreService extends GetxService {
  late User user;

  @override
  void onReady() {
    super.onReady();
    user = FirebaseAuth.instance.currentUser!;
  }

  Stream<List<Seed>> getSeeds() {
    return FirebaseFirestore.instance.collection("users").doc(user.uid).collection("seeds").snapshots().map((snap) {
      List<Seed> seeds = [];
      for (var rawSeed in snap.docs) {
        seeds.add(Seed.fromJson(rawSeed.data()));
      }
      return seeds;
    });
  }

  saveSeed(Seed seed) {
    FirebaseFirestore.instance.collection("users").doc(user.uid).collection("seeds").doc(seed.id).set(seed.toJson());
  }
}
