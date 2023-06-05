import 'package:auto_size_text/auto_size_text.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:emazong/controllers/signup_screen_controller.dart';
import 'package:emazong/utils/routes/route_names.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../res/app_colors.dart';
import '../res/app_images.dart';
import '../utils/widgets/elevated_button.dart';

class SignupScreen extends GetView<SignUpScreenController>{
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SignUpScreenController(),
        builder: (controller){
          return Obx(() => controller.platform.value == 'ios'
              ? AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.dark,
              child: signupScreenLayout(controller,context))
              : signupScreenLayout(controller,context));
        }
    );
  }

  Widget signupScreenLayout(SignUpScreenController controller, BuildContext context) => Scaffold(

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
            SvgPicture.asset(AppImages.appLogo,height: Get.height * .1,),
            AutoSizeText(
              'Create an Account',
              style: GoogleFonts.roboto(
                  fontSize: 6.sw,fontWeight: FontWeight.bold
              ),
            ),
            AutoSizeText(
              'Sign up now to get started with an account.',
              style: GoogleFonts.roboto(
                fontSize: Get.width * 0.035,
                fontWeight: FontWeight.normal,
                color: Colors.grey[800],
              ),
            ).paddingOnly(top: Get.height * 0.02),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration:  const InputDecoration(
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
                    hintText: 'Full Name',
                    contentPadding: EdgeInsets.only(
                        top: 5, left: 16, right: 16),
                  ),
                  keyboardType: TextInputType.text
                  ,
                ),
                SizedBox(height: Get.height * 0.025,),
                TextFormField(
                  decoration:  const InputDecoration(
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
                TextFormField(
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      contentPadding: const EdgeInsets.only(
                          top: 5, left: 16, right: 16),
                      border: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: AppColors.primaryColor,
                              width: 2)),
                      focusedBorder:  const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: AppColors.primaryColor,
                              width: 2)),
                      prefixIcon: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        margin:
                        const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                var code = await controller.countryCodePicker!
                                    .showPicker(context: context,initialSelectedLocale: 'US');
                                if (code != null) {
                                  controller.setCountryCode(code.dialCode);
                                }
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 6),
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                  child: Obx(() {
                                    return Text(
                                      controller.countryCode.value,
                                      style: const TextStyle(
                                          color: AppColors
                                              .textColorWhite),
                                    );
                                  })),
                            )
                          ],
                        ),
                      )),
                ),
                SizedBox(height: Get.height * 0.025,),
                TextFormField(
                  decoration:  const InputDecoration(
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
                    hintText: 'Full Address',
                    contentPadding: EdgeInsets.only(
                        top: 5, left: 16, right: 16),
                  ),
                  keyboardType: TextInputType.text
                  ,
                ),
                SizedBox(height: Get.height * 0.025,),
                CSCPicker(
                  ///Enable disable state dropdown [OPTIONAL PARAMETER]
                  showStates: true,

                  /// Enable disable city drop down [OPTIONAL PARAMETER]
                  showCities: true,

                  ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                  flagState: CountryFlag.ENABLE,

                  ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                  dropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border:
                      Border.all(color: Colors.grey.shade300, width: 1)),

                  ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade300,
                      border:
                      Border.all(color: Colors.grey.shade300, width: 1)),

                  ///placeholders for dropdown search field
                  countrySearchPlaceholder: "Country",
                  stateSearchPlaceholder: "State",
                  citySearchPlaceholder: "City",

                  ///labels for dropdown
                  countryDropdownLabel: "Country",
                  stateDropdownLabel: "State",
                  cityDropdownLabel: "City",

                  ///Default Country
                  //defaultCountry: CscCountry.India,

                  ///Disable country dropdown (Note: use it with default country)
                  //disableCountry: true,

                  ///Country Filter [OPTIONAL PARAMETER]
                  // countryFilter: [CscCountry.India,CscCountry.United_States,CscCountry.Canada],

                  ///selected item style [OPTIONAL PARAMETER]
                  selectedItemStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                  dropdownHeadingStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),

                  ///DropdownDialog Item style [OPTIONAL PARAMETER]
                  dropdownItemStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  ///Dialog box radius [OPTIONAL PARAMETER]
                  dropdownDialogRadius: 10.0,

                  ///Search bar radius [OPTIONAL PARAMETER]
                  searchBarRadius: 10.0,

                  ///triggers once country selected in dropdown
                  onCountryChanged: (value) {
                    controller.setCountry(value);
                  },

                  ///triggers once state selected in dropdown
                  onStateChanged: (value) {
                    controller.setState(value!);
                  },

                  ///triggers once city selected in dropdown
                  onCityChanged: (value) {
                    controller.setCity(value!);
                  },
                ),
                SizedBox(height: Get.height * 0.025,),
                TextFormField(
                  decoration:  const InputDecoration(
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
                    hintText: 'Zip Code / Postal Code',
                    contentPadding: EdgeInsets.only(
                        top: 5, left: 16, right: 16),
                  ),
                  keyboardType: TextInputType.number
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
                      hintText: 'Confirm Password',
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
                SizedBox(height: Get.height * 0.020,),
                Row(
                  children: [
                    Obx(() => Checkbox(
                      onChanged: (value) {
                        if(controller.termsAndConditionCheckBox == false){
                          controller.setTermsAndConditionState(true);
                        }else{
                          controller.setTermsAndConditionState(false);
                        }
                      }, value: controller.termsAndConditionCheckBox,
                    ),),

                    Text.rich(
                        TextSpan(
                            text: "Accept to all ",
                            style: GoogleFonts.roboto(
                                fontSize: 3.sw,fontWeight: FontWeight.normal,color: Colors.grey[800]
                            ),
                            children: <InlineSpan>[
                              TextSpan(
                                  text: 'terms and conditions',
                                  style: TextStyle(fontSize: 3.sw,fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                    }),
                            ]
                        )
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.02),
                CustomElevatedButton(text: 'Continue', pressCallBack: (){
                  Get.toNamed(RouteNames.otpScreen);
                }, buttonHeight: Get.height * .055, buttonWidth: Get.width * .8,)
              ],
            ).paddingSymmetric(vertical: Get.height * .05).marginSymmetric(horizontal: Get.width * .08),
          ],
        ),
      ),
    ),
  );

}