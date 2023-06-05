import 'package:auto_size_text/auto_size_text.dart';
import 'package:emazong/controllers/home_screen_controller.dart';
import 'package:emazong/utils/routes/route_names.dart';
import 'package:emazong/utils/widgets/custom_container.dart';
import 'package:emazong/utils/widgets/slider_items.dart';
import 'package:emazong/utils/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../res/app_colors.dart';

class HomeScreen extends GetView<HomeScreenController>{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeScreenController(),
        builder: (controller){
        return homeScreenLayout(controller);
        }
    );
  }
  Widget homeScreenLayout(HomeScreenController controller) => Scaffold(
    body: SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: Get.height,
        ),
        child: Column(
          children: [
            SizedBox(
              width: Get.width * 1,
              height: Get.height * 0.2,
              child: PageView(
                  controller: controller.pageViewController,
                  children: SliderItems.items()
              ),
            ),
            SmoothPageIndicator(
                controller: controller.pageViewController,  // PageController
                count:  3,
                effect: const ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: AppColors.primaryColor
                ),
            ).paddingSymmetric(vertical: Get.height * .015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  'Categories',
                  style: GoogleFonts.roboto(
                      fontSize: 5.sw,fontWeight: FontWeight.bold,color: Colors.black
                  ),
                ),
                CustomTextButton(
                    text: 'See All',
                    pressCallBack: (){},
                    textColor: AppColors.primaryColor,
                    textSize: 2
                )
              ],
            ).marginSymmetric(horizontal: Get.width * 0.04,vertical: Get.height * 0.008),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CustomContainer().container(
                        Get.width * .16,
                        Get.height * .08,
                        AppColors.primaryColor.withOpacity(.1), 10,
                        'assets/svg/shirt_cat.svg',
                        48
                    ),
                    SizedBox(height: Get.height * 0.01,),
                    AutoSizeText(
                      'Men Wear',
                      style: GoogleFonts.roboto(
                          fontSize: 1.sw,fontWeight: FontWeight.bold,color: AppColors.primaryColor
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomContainer().container(
                        Get.width * .16,
                        Get.height * .08,
                        AppColors.primaryColor.withOpacity(.1), 10,
                      'assets/svg/294099.svg',
                      40
                    ),
                    SizedBox(height: Get.height * 0.01,),
                    AutoSizeText(
                      'Women Wear',
                      style: GoogleFonts.roboto(
                          fontSize: 1.sw,fontWeight: FontWeight.bold,color: AppColors.primaryColor
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomContainer().container(
                        Get.width * .16,
                        Get.height * .08,
                        AppColors.primaryColor.withOpacity(.1), 10,
                        'assets/svg/cell_cat.svg',
                        40
                    ),
                    SizedBox(height: Get.height * 0.01,),
                    AutoSizeText(
                      'Phones',
                      style: GoogleFonts.roboto(
                          fontSize: 1.sw,fontWeight: FontWeight.bold,color: AppColors.primaryColor
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomContainer().container(
                        Get.width * .16,
                        Get.height * .08,
                        AppColors.primaryColor.withOpacity(.1),10,
                        'assets/svg/pharmacy_cat.svg',
                        38
                    ),
                    SizedBox(height: Get.height * 0.01,),
                    AutoSizeText(
                      'Pharmacy',
                      style: GoogleFonts.roboto(
                          fontSize: 1.sw,fontWeight: FontWeight.bold,color: AppColors.primaryColor
                      ),
                    ),
                  ],
                ),

              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                'Popular Products',
                style: GoogleFonts.roboto(
                    fontSize: 5.sw,fontWeight: FontWeight.bold,color: Colors.black
                ),
              ).marginSymmetric(horizontal: Get.width * 0.04,vertical: Get.height * 0.03),
            ),
            Obx(() => GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.itemsHome.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: Get.width / (Get.height * (3 / 5.4)),
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5
                ),
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Get.toNamed(RouteNames.productDetailsScreen);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.2),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                              offset: const Offset(
                                0.0,
                                0.0,
                              ),
                            )
                          ],
                        color: Colors.white
                      ),
                      child: Column(
                        children: [
                          Container(
                              height: Get.height * .16,
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(.4),
                            ),
                            width: Get.width * 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                fit: BoxFit.fill,
                                  image: NetworkImage(controller.itemsHome[index]['image'])),
                            )
                          ).paddingOnly(
                              top: Get.height * 0.01,left: Get.height * 0.01,  right: Get.height * 0.01
                          ),
                          AutoSizeText(
                            controller.itemsHome[index]['title'],
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                            style: GoogleFonts.roboto(
                                fontSize: 8,fontWeight: FontWeight.bold,color: Colors.black
                            ),
                          ).paddingSymmetric(horizontal: Get.width * .02,vertical: Get.height * .01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  AutoSizeText(
                                    controller.itemsHome[index]['price']['symbol'],
                                    style: GoogleFonts.roboto(
                                        fontSize: 3.5.sw,fontWeight: FontWeight.bold,color: AppColors.primaryColor
                                    ),
                                  ),
                                  AutoSizeText(
                                    controller.itemsHome[index]['price']['value'].toString(),
                                    style: GoogleFonts.roboto(
                                        fontSize: 3.5.sw,fontWeight: FontWeight.bold,color: AppColors.primaryColor
                                    ),
                                  ).marginOnly(left: Get.width * .01),

                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star,color: Colors.yellow,size: Get.height * .02,),
                                  AutoSizeText(
                                    controller.itemsHome[index]['rating'].toString(),
                                    style: GoogleFonts.roboto(
                                        fontSize: 3.5.sw,fontWeight: FontWeight.bold,color: AppColors.primaryColor
                                    ),
                                  ).marginOnly(left: Get.width * .01),

                                ],
                              )
                            ],
                          ).paddingSymmetric(horizontal: Get.width * .02,vertical: Get.height * .01),
                        ],
                      ),
                    ),
                  );
                }
            ).marginSymmetric(horizontal: Get.width * 0.04)),

          ],
        ),
      ),
    ),
  );

}