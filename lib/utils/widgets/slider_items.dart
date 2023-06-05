import 'package:auto_size_text/auto_size_text.dart';
import 'package:emazong/res/app_colors.dart';
import 'package:emazong/utils/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SliderItems{

  static items() => [
    Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10)
      ),
        child: Stack(
  children: [
    SizedBox(
      width: Get.width * 1,
      height: Get.height * 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: const Image(
            fit: BoxFit.cover,
            image: NetworkImage('https://plus.unsplash.com/premium_photo-1671198905435-20f8d166efb2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80')),
      ),
    ),
    Container(
      width: Get.width * 1,
      height: Get.height * 1,
      decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(10)
      ),
    ),
    Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: Get.width * 1,
        height: Get.height * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AutoSizeText(
              'Get 45 % off on fashion',
              style: GoogleFonts.roboto(
                  fontSize: 5.5.sw,fontWeight: FontWeight.bold,color: Colors.white
              ),
            ),
            CustomElevatedButton(
                text: 'Buy Now', pressCallBack: (){}, buttonHeight: 28, buttonWidth: Get.width * .1)
          ],
        ).paddingOnly(bottom: 6,right: 16),
      ),
    ),
  ],
  )

    ).marginSymmetric(horizontal: 16),
    Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Stack(
  children: [
    SizedBox(
      width: Get.width * 1,
      height: Get.height * 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: const Image(
            fit: BoxFit.cover,
            image: NetworkImage('https://images.unsplash.com/photo-1546621083-17f1e50980e9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80')),
      ),
    ),
    Container(
      width: Get.width * 1,
      height: Get.height * 1,
      decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(10)
      ),
    ),
    Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: Get.width * 1,
        height: Get.height * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AutoSizeText(
              'Get 15 % off on mobiles devices',
              style: GoogleFonts.roboto(
                  fontSize: 5.5.sw,fontWeight: FontWeight.bold,color: Colors.white
              ),
            ),
            CustomElevatedButton(
                text: 'Buy Now', pressCallBack: (){}, buttonHeight: 28, buttonWidth: Get.width * .1)
          ],
        ).paddingOnly(bottom: 6,right: 16),
      ),
    ),
  ],
  )

    ).marginSymmetric(horizontal: 16),
    Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Stack(
  children: [
    SizedBox(
      width: Get.width * 1,
      height: Get.height * 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: const Image(
            fit: BoxFit.cover,
            image: NetworkImage('https://images.unsplash.com/photo-1587854692152-cbe660dbde88?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1469&q=80')),
      ),
    ),
    Container(
      width: Get.width * 1,
      height: Get.height * 1,
      decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(10)
      ),
    ),
    Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: Get.width * 1,
        height: Get.height * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AutoSizeText(
              'Get 50 % off on pharmacy',
              style: GoogleFonts.roboto(
                  fontSize: 5.5.sw,fontWeight: FontWeight.bold,color: Colors.white
              ),
            ),
            CustomElevatedButton(
                text: 'Buy Now', pressCallBack: (){}, buttonHeight: 28, buttonWidth: Get.width * .1)
          ],
        ).paddingOnly(bottom: 6,right: 16),
      ),
    ),
  ],
  )

    ).marginSymmetric(horizontal: 16),


  ];
}