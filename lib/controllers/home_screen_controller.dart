import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{

  CarouselController carouselController = CarouselController();
  final pageViewController = PageController();
  RxList<dynamic> itemsHome = <dynamic>[].obs;

  @override
  void onInit() {
    readJsonHome();
    super.onInit();
  }

  Future<void> readJsonHome() async {
    final String response = await rootBundle.loadString('assets/json/rainforest_one.json');
    final data = await json.decode(response);
    itemsHome.assignAll(data["search_results"]);
  }
}