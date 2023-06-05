import 'package:emazong/controllers/onboard_screen_controller.dart';
import 'package:emazong/res/app_colors.dart';
import 'package:emazong/res/app_images.dart';
import 'package:emazong/utils/routes/route_names.dart';
import 'package:emazong/utils/widgets/elevated_button.dart';
import 'package:emazong/utils/widgets/on_boarding_views.dart';
import 'package:emazong/utils/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardScreen extends GetView<OnBoardScreenController>{
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OnBoardScreenController(),
        builder: (controller){
        return Obx(() => controller.platform.value == 'ios'
            ? AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: onBoardScreenLayout(controller))
            : onBoardScreenLayout(controller));
        }
    );
  }

  Widget onBoardScreenLayout(OnBoardScreenController controller) => Scaffold(
    body: SizedBox(
      width: Get.width * 1,
      height: Get.height * 1,
      child: Stack(
        children: [
          SizedBox(
            width: Get.width * 1,
            height: Get.height * .9,
            child: PageView(
              controller: controller.pageViewController,
              onPageChanged: (index){
                controller.setCurrentPage(index);
              },
              children: const [
               OnBoardingViews(image: AppImages.onBoardOneImg,title: 'Choose Product'
                   , description: 'Choose your best product form popular market place with out any delay.'),
               OnBoardingViews(image: AppImages.onBoardTwoImg,title: 'Add To Cart',
                   description: 'Manage your cart and place your order for your chosen product.'),
               OnBoardingViews(image: AppImages.onBoardThreeImg,title: 'Pay On Delivery',
                   description: 'No need to do payment with online payment system. Pay when you receive your'
                       ' placed order'),
              ],
            ),
          ),

          SizedBox(
            width: Get.width * 1,
            height: Get. height * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmoothPageIndicator(
                    controller: controller.pageViewController,  // PageController
                    count:  3,
                    effect:  const ExpandingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor: AppColors.primaryColor
                    ),  // your preferred effect
                    onDotClicked: (index){
                      if(index == 0){
                       controller.pageAnimateTo(0);
                      }else if(index == 1){
                        controller.pageAnimateTo(1);
                      }else if(index == 2){
                        controller.pageAnimateTo(2);
                      }
                    }
                ).marginOnly(bottom: 48),
                Obx(() =>controller.currentPage ==0?  CustomElevatedButton(
                    text: 'Next',
                    pressCallBack: (){
                      if (controller.pageViewController.page! < controller.totalPages - 1) {
                        controller.pageViewController.nextPage(
                            duration: const Duration(milliseconds: 500), curve: Curves.ease);
                      }
                    }, buttonHeight: 48.0, buttonWidth: Get.width * .8,
                ):controller.currentPage ==1? CustomElevatedButton(
                    text: 'Next',
                    pressCallBack: (){
                      if (controller.pageViewController.page! < controller.totalPages - 1) {
                        controller.pageViewController.nextPage(
                            duration: const Duration(milliseconds: 500), curve: Curves.ease);
                      }
                    },buttonHeight: 48.0, buttonWidth: Get.width * .8,
                ) : CustomElevatedButton(
                    text: 'Get Started',
                    pressCallBack: (){
                      Get.offNamed(RouteNames.loginScreen);
                    },buttonHeight: 48.0, buttonWidth: Get.width * .8,
                ),
                ).marginOnly(bottom: 48)
              ],
            ),
          ).paddingOnly(bottom: 28),
            SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child:Obx(() => controller.currentPage == 0?
                  CustomTextButton(text: 'Skip', pressCallBack: (){
                    controller.pageViewController.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 500), curve: Curves.ease
                    );
                  }, textColor: AppColors.primarySecondaryColor, textSize: 4,)
            : controller.currentPage == 1?  CustomTextButton(text: 'Skip', pressCallBack: (){
                controller.pageViewController.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 500), curve: Curves.ease
                );
              }, textColor: AppColors.primarySecondaryColor, textSize: 4,):const SizedBox(),
              )
            ),
          ),
        ],
      ),
    )

  );
}