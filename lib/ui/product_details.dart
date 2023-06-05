import 'package:auto_size_text/auto_size_text.dart';
import 'package:emazong/controllers/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../res/app_images.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController>{
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProductDetailsController(),
        builder: (controller){
        return Obx(() => controller.platform.value == 'ios'
            ? AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: productDetailScreenLayout(controller))
            : productDetailScreenLayout(controller));
        }
    );
  }

  Widget productDetailScreenLayout(ProductDetailsController controller) => Scaffold(
    appBar: AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey[50],
      leadingWidth: Get.width *  0.1,
      centerTitle: false,
      leading: IconButton(onPressed: (){
        Get.back();
      }, icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)).paddingOnly(left: 8),
      title: AutoSizeText(
        'Product Details',
        style: GoogleFonts.roboto(
            fontSize: 5.sw,fontWeight: FontWeight.bold,color: Colors.black
        ),
      )
    ),

  );
}