import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/app_constants.dart';
import '../utils/status_bar.dart';

class SignUpScreenController extends GetxController{

  RxString platform = ''.obs;
  final _obscureText = true.obs;
  FlCountryCodePicker? countryCodePicker;
  RxString countryCode = '+1'.obs;
  RxString country = ''.obs;
  RxString state = ''.obs;
  RxString city = ''.obs;
  final _termsAndConditionCheckBox = false.obs;


  bool get obscureText => _obscureText.value;
  bool get termsAndConditionCheckBox => _termsAndConditionCheckBox.value;

  @override
  void onInit() {
    storageInit();
    countryCodePicker = const FlCountryCodePicker();
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
  setCountryCode(String value){
    countryCode.value = value;
  }
  setCountry(String value){
    country.value = value;
  }
  setState(String value){
    state.value = value;
  }
  setCity(String value){
    city.value = value;
  }
  setTermsAndConditionState(bool value){
    _termsAndConditionCheckBox.value = value;
  }
}