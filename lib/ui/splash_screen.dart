import 'package:auto_size_text/auto_size_text.dart';
import 'package:emazong/controllers/splash_screen_controller.dart';
import 'package:emazong/res/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SplashScreen extends GetView<SplashScreenController>{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashScreenController(),
        builder: (controller){
        return Obx(() => controller.platform.value == 'ios'
            ? AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: splashScreenLayout(controller))
            : splashScreenLayout(controller));
        }
    );
  }

  Widget splashScreenLayout(SplashScreenController controller) => Scaffold(
    body: SizedBox(
      width: Get.width * 1,
      height: Get.height * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImages.appLogo,height: Get.height * .2,),
          const SizedBox(height: 14,),
          AutoSizeText(
            'Emazong',
            style: GoogleFonts.roboto(
              fontSize: 10.sw,fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    ),
  );
}