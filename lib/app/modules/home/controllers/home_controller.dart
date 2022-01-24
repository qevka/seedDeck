import 'package:get/get.dart';
import 'package:seed_deck/app/data/seed.dart';
import 'package:seed_deck/app/services/firestore.dart';

class HomeController extends GetxController {
  RxList<Seed> seeds = RxList.empty();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    seeds.bindStream(Get.find<FirestoreService>().getSeeds());
    print(seeds.length);
  }

  saveSeed(String data) async {
    print("seed was saved");
  }
}
