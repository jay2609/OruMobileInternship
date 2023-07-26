
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_app/app/modules/home/controllers/home_controller.dart';


Widget customSlider() {
  HomeController homeController = Get.find();
  final List<String> sliderList = [
    'banner_4.webp',
    //'banner_web_2.webp',
    'banner_web_3.webp',
  ];

  return Column(
    children: [
      CarouselSlider(
        // Pass the controller to the CarouselSlider
        carouselController: homeController.carouselController,
        items: sliderList.map((url) {
          return SizedBox(
            height: 80,
            child: Image.asset("assets/images/slider_Image/$url",
                fit: BoxFit.fill),
          );
        }).toList(),
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1,
          aspectRatio: 16 / 9,
          onPageChanged: (index, reason) {
            homeController.currentSlide.value = index;
          },
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: sliderList.map((url) {
          int index = sliderList.indexOf(url);
          return Obx(
            () => Padding(
              padding: const EdgeInsets.all(4.0),
              child: AnimatedContainer(
                duration:const Duration(milliseconds: 200),
                width: index == homeController.currentSlide.value ? 15 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: index == homeController.currentSlide.value
                      ?const Color.fromARGB(255, 44, 47, 69)
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ],
  );
}
