import 'dart:async';

import 'package:emazong/utils/status_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/app_constants.dart';
import '../utils/routes/route_names.dart';

class SplashScreenController extends GetxController{

  RxString platform = ''.obs;

  @override
  void onInit() {
    storageInit();

    checkAuthStatus();
    super.onInit();
  }
  void storageInit() {
    final box = GetStorage();
    platform.value = box.read(Constants.platForm);
    // Android Status Bar Theme
    if(platform.value == 'android'){
      StatusBar().setStatusBarDark();
    }
  }

  void checkAuthStatus() {
    Timer(const Duration(seconds: 2), () {
      Get.offNamed(RouteNames.onBoardScreen);
    });
  }
}