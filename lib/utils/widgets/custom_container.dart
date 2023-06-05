import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../res/app_colors.dart';

class CustomContainer{

  Widget container(double height, double width, Color color,double radius, String image,double imageHeight) => Container(
    width: Get.width * .15,
    height: Get.height * .07,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius)
    ),
    child: Center(
      child: SvgPicture.asset(image,height: imageHeight,color: AppColors.primaryColor,),
    ),
  );
}