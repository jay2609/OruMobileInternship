// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oru_app/app/modules/notification_page/views/notification_page_view.dart';

Widget buildHorizontalListView() {
  final List<String> itemList = [
    "mbr_apple.webp",
    'mbr_xiaomi.webp',
    'mbr_samsung.webp',
    'mbr_moto.webp',
    'mbr_vivo.webp',
    'mbr_oneplus.webp',
    'mbr_oppo.webp',
    'mbr_realme.webp',
  ];

  return Container(
    height: 80,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemList.length + 1,
      itemBuilder: (context, index) {
        return (index < itemList.length)
            ? Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                    width: 100,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      // You can also use BorderRadius.circular(75.0) instead of shape: BoxShape.circle
                      // to create a circular border with a custom radius.
                    ),
                    child: Image.asset(
                        "assets/images/brandlogo/${itemList[index]}")))
            : Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () {
                    Get.to(const NotificationPageView());
                  },
                  child: Container(
                      width: 100,
                      height: 55,
                      decoration: BoxDecoration(
                        color:const Color.fromARGB(255, 207, 206, 206),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        // You can also use BorderRadius.circular(75.0) instead of shape: BoxShape.circle
                        // to create a circular border with a custom radius.
                      ),
                      child:const Center(child: Text("Show All"))),
                ),
              );
      },
    ),
  );
}

Widget features() {
  final List<String> itemListsvg = [
    "assets/svg/f1.svg",
    "assets/svg/f2.svg",
    "assets/svg/f3.svg",
    "assets/svg/f4.svg",
    "assets/svg/f5.svg",
  ];
  final List<String> itemListtext = [
    "Bestselling\nMobiles",
    "Verified\nDevice Only",
    "Like New\nCondition",
    "Phone with\nWarranty",
    "Shop by\nPrice",
  ];

  return Container(
    height: 100,
    width: 80,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemListsvg.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Container(
                    width: 70,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      // You can also use BorderRadius.circular(75.0) instead of shape: BoxShape.circle
                      // to create a circular border with a custom radius.
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        itemListsvg[index],
                      ),
                    )),
               const SizedBox(
                  height: 5,
                ),
                Text(
                  itemListtext[index],
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ));
      },
    ),
  );
}
