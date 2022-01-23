import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/qrview/bindings/qrview_binding.dart';
import '../modules/qrview/views/scanner.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.qrVIEW,
      page: () => Scanner(),
      binding: ScannerBinding(),
    ),
  ];
}
