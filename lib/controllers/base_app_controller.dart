import 'dart:io';
import 'package:emazong/utils/app_constants.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BaseAppController extends GetxController{

  @override
  void onInit(){
    getDeviceType();
    setDeviceOrientationPortraitUp();
    super.onInit();
  }
  setDeviceOrientationPortraitUp(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
  }

  void getDeviceType() {
    final box = GetStorage();
    if(Platform.isAndroid){
      box.write(Constants.platForm, 'android');
    }else{
      box.write(Constants.platForm, 'ios');
    }
  }
}