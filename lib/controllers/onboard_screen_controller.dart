import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/app_constants.dart';
import '../utils/status_bar.dart';

class OnBoardScreenController extends GetxController{

  RxString platform = ''.obs;
  final _currentPage = 0.obs;
  final int totalPages = 3;
  int get currentPage => _currentPage.value;
  final pageViewController = PageController(
    initialPage: 0,
  );

  void changePage(int index) {
    _currentPage.value = index;
  }

  @override
  void onInit() {
    storageInit();

    super.onInit();
  }

  @override
  void onClose() {
    pageViewController.dispose();
    super.onClose();
  }

  void storageInit() {
    final box = GetStorage();
    platform.value = box.read(Constants.platForm);
    // Android Status Bar Theme
    if(platform.value == 'android'){
      StatusBar().setStatusBarDark();
    }
  }
  setCurrentPage(int value){
    _currentPage.value = value;
  }

  pageAnimateTo(int value){
    pageViewController.animateToPage(
        value,
        duration: const Duration(milliseconds: 500), curve: Curves.ease
    );
  }
}