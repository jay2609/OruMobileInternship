import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:oru_app/app/modules/home/controllers/home_controller.dart';
import 'package:oru_app/app/modules/home/utils/filterChip.dart';
import 'package:oru_app/app/modules/notification_page/bindings/notification_page_binding.dart';
import 'package:oru_app/app/modules/notification_page/views/notification_page_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return SliverAppBar(
        //floating: true,
        pinned: true,
        snap: false,
        backgroundColor: const Color.fromARGB(255, 44, 47, 69),
        centerTitle: false,
        elevation: 0,
        title: InkWell(
          onTap: () {
            homeController.enabledSeach.value = false;
          },
          child: SvgPicture.asset(
            "assets/svg/logo_square.svg",
            color: Colors.white,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: SizedBox(
            height: 10,
            child: SvgPicture.asset(
              "assets/svg/drawer.svg",
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            child:
                const Row(children: [Text("India"), Icon(Icons.location_on)]),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.to(const NotificationPageView(),
                    binding: NotificationPageBinding());
              },
              child: Center(
                child: Badge(
                  label: Text(
                    "1",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.notifications_none_outlined),
                ),
              ),
            ),
          )
        ],
        bottom: AppBar(
          backgroundColor: const Color.fromARGB(255, 44, 47, 69),
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        5), // Make it half of the height to get a circular shape
                  ),
                  child: Center(
                    child: TextField(
                      controller: homeController.searchTextcontroller,
                      decoration: InputDecoration(
                          hintText: 'Search with make and model..',
                          prefixIcon: const Icon(Icons.search),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          suffixIcon: Visibility(
                              visible: homeController
                                  .searchTextcontroller.text.isNotEmpty,
                              child: IconButton(
                                  onPressed: () {
                                    homeController.searchTextcontroller.clear();
                                    homeController.fetchSearchData("");
                                  },
                                  icon: const Icon(Icons.clear)))),
                      onTap: () {
                        homeController.enabledSeach.value = true;
                        print("__________${homeController.enabledSeach.value}");
                      },
                      onChanged: (val) {
                        homeController.fetchSearchData(val);
                      },
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: homeController.searchTextcontroller.text.isNotEmpty,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(filterUI(), elevation: 10);
                  },
                  child: Container(
                    height: 43,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 67, 66, 66),
                      borderRadius: BorderRadius.circular(
                          5), // Make it half of the height to get a circular shape
                    ),
                    child: const Icon(Icons.filter_alt_outlined),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
