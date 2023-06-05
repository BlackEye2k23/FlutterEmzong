import 'package:emazong/res/app_colors.dart';
import 'package:emazong/ui/tabs/cart_screen.dart';
import 'package:emazong/ui/tabs/categories_screen.dart';
import 'package:emazong/ui/tabs/home_screen.dart';
import 'package:emazong/ui/tabs/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../utils/app_constants.dart';
import '../utils/status_bar.dart';

class BaseScreenController extends GetxController{
  RxString platform = ''.obs;
  final PersistentTabController persistentTabController = PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.category),
        title: ("Categories"),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  List<Widget> buildScreens() {
    return [
      HomeScreen(),
      CategoriesScreen(),
      CartScreen(),
      ProfileScreen()
    ];
  }


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
}