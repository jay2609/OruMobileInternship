// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_app/app/modules/home/controllers/home_controller.dart';

Widget filterUI() {
  HomeController homeController = Get.find();
  return Container(
    decoration:const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0), // Adjust the radius as needed
        topRight: Radius.circular(20.0), // Adjust the radius as needed
      ),
    ),
    child: Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 7, right: 4),
                child: Text("Filters",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )),
              ),
              InkWell(
                onTap: () {
                  homeController.brandSelected.clear();
                  homeController.conditionSelected.clear();
                  homeController.storageSelected.clear();
                  homeController.ramSelected.clear();
                },
                child:const Padding(
                  padding:  EdgeInsets.only(
                      top: 20, bottom: 20, left: 4, right: 7),
                  child: Text("clear Filter",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      )),
                ),
              ),
            ],
          ),
          /////////////////////////////////////////////////////////////////
        const  Padding(
            padding:
                 EdgeInsets.only(top: 1, bottom: 1, left: 4, right: 4),
            child: Text("Brand",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: homeController.filters.value.make.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 1, bottom: 1, right: 4, left: 4),
                    child: FilterChip(
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Adjust the radius as per your preference
                        side:const BorderSide(
                          color: Colors.grey, // Border color based on selection
                          width: 1, // Border width
                        ),
                      ),
                      selected: homeController.brandSelected.contains(
                                  homeController.filters.value.make[index]) ==
                              true
                          ? true
                          : false,
                      backgroundColor: Colors.white,
                      label: Text(homeController.filters.value.make[index]),
                      labelStyle: const TextStyle(color: Colors.black),
                      onSelected: (selected) {
                       // print(homeController.brandSelected);
                        if (homeController.brandSelected.contains(
                            homeController.filters.value.make[index])) {
                          homeController.brandSelected
                              .remove(homeController.filters.value.make[index]);
                        } else {
                          homeController.brandSelected
                              .add(homeController.filters.value.make[index]);
                        }
                      },
                    ),
                  );
                }),
          ),
          /////////////////////////////////////////////////////////////////
          const Padding(
            padding: EdgeInsets.only(top: 1, bottom: 1, left: 4, right: 4),
            child: Text("Condition",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: homeController.filters.value.condition.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 1, bottom: 1, right: 4, left: 4),
                    child: FilterChip(
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Adjust the radius as per your preference
                        side: const BorderSide(
                          color: Colors.grey, // Border color based on selection
                          width: 1, // Border width
                        ),
                      ),
                      selected: homeController.conditionSelected.contains(
                                  homeController
                                      .filters.value.condition[index]) ==
                              true
                          ? true
                          : false,
                      backgroundColor: Colors.white,
                      label:
                          Text(homeController.filters.value.condition[index]),
                      labelStyle: const TextStyle(color: Colors.black),
                      onSelected: (selected) {
                        //print(homeController.conditionSelected);
                        if (homeController.conditionSelected.contains(
                            homeController.filters.value.condition[index])) {
                          homeController.conditionSelected.remove(
                              homeController.filters.value.condition[index]);
                        } else {
                          homeController.conditionSelected.add(
                              homeController.filters.value.condition[index]);
                        }
                      },
                    ),
                  );
                }),
          ), /////////////////////////////////////////////////////////////////
          const Padding(
            padding:
                 EdgeInsets.only(top: 1, bottom: 1, left: 4, right: 4),
            child: Text("Storage",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: homeController.filters.value.storage.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 1, bottom: 1, right: 4, left: 4),
                    child: FilterChip(
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Adjust the radius as per your preference
                        side:const BorderSide(
                          color: Colors.grey, // Border color based on selection
                          width: 1, // Border width
                        ),
                      ),
                      selected: homeController.storageSelected.contains(
                                  homeController
                                      .filters.value.storage[index]) ==
                              true
                          ? true
                          : false,
                      backgroundColor: Colors.white,
                      label: Text(homeController.filters.value.storage[index]),
                      labelStyle:const TextStyle(color: Colors.black),
                      onSelected: (selected) {
                       // print(homeController.storageSelected);
                        if (homeController.storageSelected.contains(
                            homeController.filters.value.storage[index])) {
                          homeController.storageSelected.remove(
                              homeController.filters.value.storage[index]);
                        } else {
                          homeController.storageSelected
                              .add(homeController.filters.value.storage[index]);
                        }
                      },
                    ),
                  );
                }),
          ), /////////////////////////////////////////////////////////////////
         const Padding(
            padding:
                 EdgeInsets.only(top: 1, bottom: 1, left: 4, right: 4),
            child: Text("RAM",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: homeController.filters.value.ram.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 1, bottom: 1, right: 4, left: 4),
                    child: FilterChip(
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Adjust the radius as per your preference
                        side:const BorderSide(
                          color: Colors.grey, // Border color based on selection
                          width: 1, // Border width
                        ),
                      ),
                      selected: homeController.ramSelected.contains(
                                  homeController.filters.value.ram[index]) ==
                              true
                          ? true
                          : false,
                      backgroundColor: Colors.white,
                      label: Text(homeController.filters.value.ram[index]),
                      labelStyle:const TextStyle(color: Colors.black),
                      onSelected: (selected) {
                        //print(homeController.ramSelected);
                        if (homeController.ramSelected.contains(
                            homeController.filters.value.ram[index])) {
                          homeController.ramSelected
                              .remove(homeController.filters.value.ram[index]);
                        } else {
                          homeController.brandSelected
                              .add(homeController.filters.value.ram[index]);
                        }
                      },
                    ),
                  );
                }),
          ),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50, // Set the height as per your requirement
                decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 2, 25, 59), // Dark blue color
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                    child: Text(
                  "Apply",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                )),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
