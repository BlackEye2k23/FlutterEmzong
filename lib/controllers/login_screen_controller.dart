import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/app_constants.dart';
import '../utils/status_bar.dart';

class LoginScreenController extends GetxController{

  RxString platform = ''.obs;
  final _obscureText = true.obs;


  bool get obscureText => _obscureText.value;

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
  setObscureText(bool value){
    _obscureText.value = value;
  }
}