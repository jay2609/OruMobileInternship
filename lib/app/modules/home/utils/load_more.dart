import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

Widget loadmore() {
  final HomeController homeController = Get.find();
  return InkWell(
    onTap: () {
      homeController.loadMoreListings();
    },
    child: Obx(
      () => Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.black, // Specify the border color here
              width: 1.0, // Specify the border width
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
              child: Text(
            homeController.loading == false ? "Load More" : "Loading...",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 17),
          )),
        ),
      )),
    ),
  );
}
