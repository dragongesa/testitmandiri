// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itmandiri/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1. Pilih JSON'),
        centerTitle: true,
      ),
      body: Center(
        child: OutlinedButton(
          child: Text("Pilih JSON File yang ingin diuji"),
          onPressed: () {
            controller.getFile().then((value) {
              if (value == false) {
                Get.defaultDialog(content: Text(controller.isError?controller.errorMessage!:"Silakan pilih filenya dulu!"));
              } else if (value == true) {
                Get.toNamed(Routes.SELECTION, arguments: controller.json);
              }
            });
          },
        ),
      ),
    );
  }
}
