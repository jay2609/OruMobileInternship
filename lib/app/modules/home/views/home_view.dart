import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oru_app/Utils/AppBar.dart';
import 'package:oru_app/app/modules/home/views/homeWidgets.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance.collection("ss").add({"data": "d"});
    return Scaffold(
      body: Obx(
        () => CustomScrollView(
          slivers: [
            CustomAppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                  controller.enabledSeach.value ? searchWidgets : homeWidget),
            ),
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
