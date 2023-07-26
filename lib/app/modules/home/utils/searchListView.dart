// ignore_for_file: file_names, avoid_unnecessary_containers

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

Widget searchListModel() {
  final HomeController homeController = Get.find();
  log("object____${homeController.searchResult().makes.length}");

  return Container(
    child: Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: homeController.searchResult().makes.isNotEmpty,
            child: const Padding(
              padding: EdgeInsets.only(top: 5, left: 8, right: 8),
              child: Text("Brand",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: homeController.searchResult().makes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 2, left: 8, right: 8),
                  child: SizedBox(
                    height: 30,
                    //color: Colors.amber,
                    child: Text(homeController.searchResult().makes[index]),
                  ),
                );
              }),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: homeController.searchResult().models.isNotEmpty,
                child: const Padding(
                  padding: EdgeInsets.only(top: 5, left: 8, right: 8),
                  child: Text("Mobile Model",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homeController.searchResult().models.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 2, left: 8, right: 8),
                      child: SizedBox(
                        height: 30,
                        //color: Colors.amber,
                        child:
                            Text(homeController.searchResult().models[index]),
                      ),
                    );
                  }),
            ],
          ),
        ],
      ),
    ),
  );
}
