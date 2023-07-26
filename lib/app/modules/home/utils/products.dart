import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:oru_app/app/modules/home/controllers/home_controller.dart';
import 'package:oru_app/app/modules/home/utils/dateConvert.dart';

import 'package:shimmer/shimmer.dart';

Widget productList() {
  final HomeController homeController = Get.find();
  // ignore: avoid_unnecessary_containers
  return Container(
    child: Obx(
      () {
        if (homeController.listings.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          //print("run________________________________");
          return StaggeredGridView.countBuilder(
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            itemCount: homeController.listings.length + 1,
            itemBuilder: (context, index) {
              //log(homeController.listings[index].listingNumPrice.toString());
              //print(
              //    "run__________${homeController.listings.length}_______________$index");
              if (index < homeController.listings.length) {
                //   print(homeController.listings[index].listingNumPrice);
                //log(homeController.listings[index].listingNumPrice);
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    // You can also use BorderRadius.circular(75.0) instead of shape: BoxShape.circle
                    // to create a circular border with a custom radius.
                  ),
                  padding:const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible: homeController.listings[index].verified,
                            // ignore: avoid_unnecessary_containers
                            child: Container(
                              child: SvgPicture.asset(
                                "assets/svg/verified.svg",
                                height: 25,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon:const Icon(
                                Icons.favorite_outline,
                                color: Colors.red,
                              )),
                        ],
                      ),
                      Center(
                        child: CachedNetworkImage(
                          height: 120,
                          imageUrl: homeController.listings[index].defaultImage,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                                width: 50, height: 40, color: Colors.white),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "₹ ${homeController.listings[index].listingNumPrice.toString()}",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            homeController.listings[index].model,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            homeController.listings[index].deviceStorage,
                            style: const TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 104, 104, 104)),
                          ),
                          Text(
                            "Condition: ${homeController.listings[index].deviceCondition}",
                            style: const TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 104, 104, 104)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            homeController.listings[index].listingLocation,
                            style: const TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 104, 104, 104)),
                          ),
                          Text(
                            formatDate(homeController
                                .listings[index].listingDate
                                .toString()),
                            style: const TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 104, 104, 104)),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
            staggeredTileBuilder: (index) {
              return const StaggeredTile.fit(1);
            },
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
          );
        }
      },
    ),
  );
}
