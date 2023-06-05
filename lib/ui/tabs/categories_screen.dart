import 'package:emazong/controllers/categories_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen  extends GetView<CategoriesScreenController>{
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CategoriesScreenController(),
        builder: (controller){
        return categoriesScreenLayout(controller);
        }
    );
  }

  Widget categoriesScreenLayout(CategoriesScreenController controller) => Scaffold(

  );
}