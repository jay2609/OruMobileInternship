import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'package:oru_app/Utils/local_notification_service.dart';
import 'package:oru_app/api/get_product_api.dart';
import 'package:oru_app/api/search_api.dart';
import 'package:oru_app/models/get_product.dart';

import '../../../../api/filter_api.dart';
import '../../../../models/filter_model.dart';
import '../../../../models/search_product.dart';

class HomeController extends GetxController {
  final ApiProvider _apiProvider = ApiProvider();
  final RxList<Listing> listings = <Listing>[].obs;
  final int initialPage = 1;
  final int limit = 10;
  final loading = false.obs;
  RxBool enabledSeach = false.obs;
  final SearchApi _apiServicePost = SearchApi();
  final searchResult = SearchModel(makes: [], models: [], message: '').obs;
  TextEditingController searchTextcontroller = TextEditingController().obs();
  RxList<String> brandSelected = <String>[].obs;
  RxList<String> conditionSelected = <String>[].obs;
  RxList<String> storageSelected = <String>[].obs;
  RxList<String> ramSelected = <String>[].obs;
  var filters = FiltersModel(
    make: [],
    condition: [],
    storage: [],
    ram: [],
    message: '',
  ).obs;
  var isLoading = true.obs;
  final CarouselController carouselController = CarouselController().obs();

  // Current slide index
  final RxInt currentSlide = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchListings();
    fetchFilters();
    initMe();
    backgound();
    forground();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    super.onClose();
    listings.clear();
  }

  Future<void> fetchListings() async {
    try {
      final List<Listing> newItem =
          await _apiProvider.getListings(page: initialPage, limit: limit);
      listings.addAll(newItem);
    } catch (e) {
      log("Error fetching listings:$e");
    }
  }

  Future<void> loadMoreListings() async {
    try {
      loading.value = true;
      final List<Listing> newItems =
          await _apiProvider.getListings(page: initialPage + 1, limit: limit);
      listings.addAll(newItems);
      loading.value = false;
    } catch (e) {
      log("Error fetching more listings:$e");
    }
  }

  Future<void> fetchSearchData(String query) async {
    try {
      final result = await _apiServicePost.searchModel(query);
      searchResult.value = result;
    } catch (e) {
      log('Controller Error: $e');
    }
  }

  Future<void> fetchFilters() async {
    try {
      isLoading.value = true;
      final apiService = ApiService();
      filters.value = await apiService.getFilters();
    } catch (e) {
      log('Error while fetching filters: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // 1. This method call when app in terminated state and you get a notification
  // when you click on notification app open from terminated state and you can get notification data in this method
  void initMe() {
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        log("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          // print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );
  }

  void forground() {
    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        log("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
  }

  // 3. This method only call when App in background and not terminated(not closed)
  void backgound() {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        log("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {}
      },
    );
  }
}
