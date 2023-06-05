import 'package:emazong/controllers/cart_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends GetView<CartScreenController>{
  @override
  Widget build(BuildContext context) {
   return GetBuilder(
     init: CartScreenController(),
       builder: (controller){
       return cartScreenLayout(controller);
       }
   );
  }

  Widget cartScreenLayout(CartScreenController controller)=> Scaffold(
    body: SizedBox(
      height: Get.height  * 1,
      width: Get.width * 1,
      child: Stack(
        children: [

        ],
      ),
    ),
  );
}