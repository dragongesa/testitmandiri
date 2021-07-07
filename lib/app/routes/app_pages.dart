// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import 'package:itmandiri/app/modules/home/bindings/home_binding.dart';
import 'package:itmandiri/app/modules/home/views/home_view.dart';
import 'package:itmandiri/app/modules/selection/bindings/selection_binding.dart';
import 'package:itmandiri/app/modules/selection/views/selection_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SELECTION,
      page: () => const SelectionView(),
      binding: SelectionBinding(),
    ),
  ];
}
