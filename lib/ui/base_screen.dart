import 'package:auto_size_text/auto_size_text.dart';
import 'package:emazong/controllers/base_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../res/app_images.dart';

class BaseScreen extends GetView<BaseScreenController>{
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BaseScreenController(),
        builder: (controller){
        return Obx(() => controller.platform.value == 'ios'
            ? AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: baseScreenLayout(controller))
            : baseScreenLayout(controller));
        }
    );
  }

  Widget baseScreenLayout(BaseScreenController controller) => Scaffold(
    appBar: AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey[50],
      leadingWidth: Get.width *  0.1,
      centerTitle: false,
      title: Row(
        children: [
          SvgPicture.asset(AppImages.appLogo,height: Get.height * .04,),

          AutoSizeText(
            'Emazong',
            style: GoogleFonts.roboto(
                fontSize: 6.sw,fontWeight: FontWeight.bold,color: Colors.black
            ),
          ).paddingSymmetric(horizontal: Get.width * 0.04),
        ],
      ),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none,color: Colors.black,))
      ],
    ),
    body: PersistentTabView(
      Get.context!,
      controller: controller.persistentTabController,
      screens: controller.buildScreens(),
      items: controller.navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    ),
  );
}