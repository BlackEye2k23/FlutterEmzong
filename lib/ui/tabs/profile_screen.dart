import 'package:emazong/controllers/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileScreenController>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileScreenController(),
        builder: (controller){
        return profileScreenLayout(controller);
        }
    );
  }
  Widget profileScreenLayout(ProfileScreenController controller) => Scaffold();
}