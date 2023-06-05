import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/app_constants.dart';
import '../utils/status_bar.dart';

class OtpScreenController extends GetxController{


  RxString platform = ''.obs;
  final _buttonEnabledVerify = false.obs;


  bool get buttonEnabledVerify => _buttonEnabledVerify.value;


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
  setButtonEnabledVerify(bool value){
    _buttonEnabledVerify.value = value;
  }
}