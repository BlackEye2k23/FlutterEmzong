import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/app_constants.dart';
import '../utils/status_bar.dart';

class ProductDetailsController extends GetxController{
  RxString platform = ''.obs;

  @override
  void onInit() {
    storageInit();
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
}