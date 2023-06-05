import 'package:auto_size_text/auto_size_text.dart';
import 'package:emazong/controllers/login_screen_controller.dart';
import 'package:emazong/res/app_colors.dart';
import 'package:emazong/utils/routes/route_names.dart';
import 'package:emazong/utils/widgets/elevated_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../res/app_images.dart';
import '../utils/widgets/text_button.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LoginScreenController(),
        builder: (controller) {
          return Obx(() => controller.platform.value == 'ios'
              ? AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle.dark,
                  child: loginScreenLayout(controller))
              : loginScreenLayout(controller));
        });
  }
  Widget loginScreenLayout(LoginScreenController controller) => Scaffold(

    body: SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: Get.height,
        ),
        child: Column(
          children: [
            SafeArea(child: SvgPicture.asset(AppImages.appLogo,height: Get.height * .1,)).paddingSymmetric(vertical: Get.height * 0.02),
            AutoSizeText(
              'Login to your Account',
              style: GoogleFonts.roboto(
                  fontSize: 6.sw,fontWeight: FontWeight.bold
              ),
            ),
            AutoSizeText(
              'Welcome back, please enter your details',
              style: GoogleFonts.roboto(
                fontSize: Get.width * 0.03,
                fontWeight: FontWeight.normal,
                color: Colors.grey[800],
              ),
            ).paddingSymmetric(vertical: Get.height * 0.02),
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
                  keyboardType: TextInputType.emailAddress
                  ,
                ),
                SizedBox(height: Get.height * 0.025,),
                Obx(() =>  TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2
                        ),
                      ),
                      hintText: 'Password',
                      contentPadding: EdgeInsets.only(
                          top: 5, left: 16, right: 16),
                      suffixIcon: IconButton(onPressed: (){
                        if(controller.obscureText  == true){
                          controller.setObscureText(false);
                        }else{
                          controller.setObscureText(true);
                        }
                      }, icon: const Icon(Icons.visibility))
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: controller.obscureText,
                ),),

                Align(
                  alignment: Alignment.centerRight,
                  child: CustomTextButton(text: 'Forgot Password?', pressCallBack: () {
                    Get.toNamed(RouteNames.forgotPasswordScreen);
                  }, textColor: AppColors.primaryColor, textSize: 2.5,)
                ),
                SizedBox(height: Get.height * 0.05),
                CustomElevatedButton(text: 'Sign In', pressCallBack: (){
                  Get.offAllNamed(RouteNames.baseScreen);
                }, buttonHeight: Get.height * .055, buttonWidth: Get.width * .8,)
              ],
            ).paddingSymmetric(vertical: Get.height * .05).marginSymmetric(horizontal: Get.width * .08),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        indent: 20.0,
                        endIndent: 10.0,
                        thickness: 1,
                      ),
                    ),
                    AutoSizeText(
                      'Or Continue with',
                      style: GoogleFonts.roboto(
                          fontSize: 3.5.sw,fontWeight: FontWeight.bold,color: Colors.black
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        indent: 10.0,
                        endIndent: 20.0,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: Get.height * .06,
                      width: Get.width * .2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey,width: 1)
                      ),
                      child: Center(
                        child: SvgPicture.asset(AppImages.googleIcon,height: 24,width: 24,)
                      ),
                    ),
                    SizedBox(width: Get.width * 0.04,),
                    Container(
                      height: Get.height * .06,
                      width: Get.width * .2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey,width: 1)

                      ),
                      child: Center(
                          child: SvgPicture.asset(AppImages.facebookIcon,height: 24,width: 24,)
                      ),
                    ),
                  ],
                ).paddingSymmetric(vertical: Get.height * .03),
                Text.rich(
                    TextSpan(
                        text: "Don't have an account? ",
                        style: GoogleFonts.roboto(
                            fontSize: 3.sw,fontWeight: FontWeight.normal,color: Colors.grey[800]
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Sign Up.',
                            style: TextStyle(fontSize: 3.5.sw,fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                              Get.toNamed(RouteNames.signupScreen);
                          }),
                        ]
                    )
                )
              ],
            ).paddingSymmetric(vertical: Get.height * 0.01),
          ],
        ),
      ),
    ),
  );
}
