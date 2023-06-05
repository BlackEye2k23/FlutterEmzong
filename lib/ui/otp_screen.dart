import 'package:auto_size_text/auto_size_text.dart';
import 'package:emazong/controllers/otp_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../res/app_colors.dart';
import '../res/app_images.dart';
import '../utils/widgets/elevated_button.dart';
import '../utils/widgets/text_button.dart';

class OtpScreen extends GetView<OtpScreenController>{
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return GetBuilder(
     init: OtpScreenController(),
       builder: (controller){
         return Obx(() => controller.platform.value == 'ios'
             ? AnnotatedRegion<SystemUiOverlayStyle>(
             value: SystemUiOverlayStyle.dark,
             child: otpScreenLayout(controller))
             : otpScreenLayout(controller));
       }
   );
  }
  Widget otpScreenLayout(OtpScreenController controller) => Scaffold(

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
            SvgPicture.asset(AppImages.appLogo,height: Get.height * .1,).paddingSymmetric(vertical: Get.height * 0.02),
            AutoSizeText(
              'Enter OTP',
              style: GoogleFonts.roboto(
                  fontSize: 6.sw,fontWeight: FontWeight.bold
              ),
            ),
            Column(
              children: [
                AutoSizeText(
                  'We have sent the code to',
                  style: GoogleFonts.roboto(
                    fontSize: Get.width * 0.035,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[800],
                  ),
                ).paddingOnly(top: Get.height * 0.02),
                AutoSizeText(
                  '+9212321312231',
                  style: GoogleFonts.roboto(
                    fontSize: Get.width * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ).paddingOnly(top: Get.height * 0.001)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    inactiveFillColor: Colors.transparent,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    selectedColor: AppColors.primaryColor,
                    disabledColor: Colors.white,
                    activeColor: AppColors.primaryColor,
                    inactiveColor: Colors.grey
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  // backgroundColor: Colors.blue.shade50,
                  enableActiveFill: true,
                  // errorAnimationController: errorController,
                  // controller: textEditingController,
                  onCompleted: (v) {
                    controller.setButtonEnabledVerify(true);
                  },
                  onChanged: (value) {
                    if(value.length < 6){
                      controller.setButtonEnabledVerify(false);
                    }
                  },
                  beforeTextPaste: (text) {
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  }, appContext: Get.context!,
                ),
                SizedBox(height: Get.height * 0.025,),
                Text.rich(
                    TextSpan(
                        text: "This code will expire in ",
                        style: GoogleFonts.roboto(
                            fontSize: 3.sw,fontWeight: FontWeight.normal,color: Colors.grey[800]
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                              text: '55 sec',
                              style: TextStyle(fontSize: 3.sw,fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor),
                              ),
                        ]
                    )
                ),
                CustomTextButton(
                    text: 'Resend Code',
                    pressCallBack: (){},
                    textColor: Colors.black,
                    textSize: 0.1.sw
                ).paddingOnly(top: Get.height * 0.001),

                SizedBox(height: Get.height * 0.05),
                Obx(() => ElevatedButton(
                  onPressed: controller.buttonEnabledVerify == false?null:(){

                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(Get.width * .8, Get.height * .055),
                  ),
                  child: AutoSizeText(
                    'Verify',
                    style: GoogleFonts.roboto(
                        fontSize: 4.sw,fontWeight: FontWeight.bold
                    ),
                  ),
                ).paddingOnly(top: Get.height * 0.2)),

              ],
            ).paddingSymmetric(vertical: Get.height * .05).marginSymmetric(horizontal: Get.width * .08),
          ],
        ),
      ),
    ),
  );

}