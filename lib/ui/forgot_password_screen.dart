import 'package:auto_size_text/auto_size_text.dart';
import 'package:emazong/controllers/forgot_password_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../res/app_colors.dart';
import '../res/app_images.dart';
import '../utils/widgets/elevated_button.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordScreenController>{
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ForgotPasswordScreenController(),
        builder: (controller){
        return Obx(() => controller.platform.value == 'ios'
            ? AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: forgotPasswordScreenLayout(controller))
            : forgotPasswordScreenLayout(controller));
        }
    );
  }
  Widget forgotPasswordScreenLayout(ForgotPasswordScreenController controller) => Scaffold(

    body: SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: Get.height,
        ),
        child: Column(
          children: [
            SafeArea(child: Align(alignment: Alignment.topLeft,child: IconButton(onPressed: (){
              Get.back();
            }, icon: const Icon(Icons.arrow_back_ios)).marginSymmetric(horizontal: Get.width * .04))),
            SvgPicture.asset(AppImages.appLogo,height: Get.height * .1,).paddingSymmetric(vertical: Get.height * 0.01),
            AutoSizeText(
              'Forgot Password?',
              style: GoogleFonts.roboto(
                  fontSize: 6.sw,fontWeight: FontWeight.bold
              ),
            ),
            Column(
              children: [
                AutoSizeText(
                  'Enter the your email address and tab continue. An email will be sent to your entered email address.'
                      ' Tab on the link to enter your new password.',
                  style: GoogleFonts.roboto(
                    fontSize: Get.width * 0.035,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.center,
                ).paddingOnly(top: Get.height * 0.02,left: Get.width * 0.08,right: Get.width * 0.08),

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 2
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 2
                      ),
                    ),
                    hintText: 'Email Address',
                    contentPadding: EdgeInsets.only(
                        top: 5, left: 16, right: 16),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomElevatedButton(text: 'Send Email', pressCallBack: (){

                }, buttonHeight: Get.height * .055, buttonWidth: Get.width * .8,).paddingOnly(top:
                Get.height * 0.4)
              ],
            ).paddingSymmetric(vertical: Get.height * .05).marginSymmetric(horizontal: Get.width * .08),
          ],
        ),
      ),
    ),
  );

}