import 'package:auto_size_text/auto_size_text.dart';
import 'package:emazong/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OnBoardingViews extends StatelessWidget {
  const OnBoardingViews({
    Key? key,
    required this.title,
    required this.description,
    required this.image,

  }) : super(key: key);
  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SvgPicture.asset(image,height: Get.height * .2,),
          Image(image: AssetImage(image),height: Get.height * .2,),
          const SizedBox(height: 24,),
          AutoSizeText(
            title,
            style: GoogleFonts.roboto(
                fontSize: 7.sw,fontWeight: FontWeight.bold,color: AppColors.primaryColor
            ),
          ),
          const SizedBox(height: 18,),
          SizedBox(
            width: Get.width * .7,
            child: AutoSizeText(
              textAlign: TextAlign.center,
              description,
              style: GoogleFonts.roboto(
                  fontSize: 3.5.sw,fontWeight: FontWeight.normal,color: Colors.black,
              ),
            ),
          ),
        ],
      )
    );
  }
}
