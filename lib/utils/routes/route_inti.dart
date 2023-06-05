import 'package:emazong/ui/base_screen.dart';
import 'package:emazong/ui/forgot_password_screen.dart';
import 'package:emazong/ui/product_details.dart';
import 'package:emazong/ui/tabs/home_screen.dart';
import 'package:emazong/ui/otp_screen.dart';
import 'package:emazong/ui/sign_up_screen.dart';
import 'package:emazong/ui/login_screen.dart';
import 'package:emazong/ui/onboard_screen.dart';
import 'package:emazong/ui/splash_screen.dart';
import 'package:emazong/utils/routes/route_names.dart';
import 'package:get/get.dart';

class RoutesInit {
  static appRoutes() => [
    GetPage(
        name: RouteNames.splashScreen,
        page: () => const SplashScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: RouteNames.onBoardScreen,
        page: () => const OnBoardScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: RouteNames.loginScreen,
        page: () => const LoginScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: RouteNames.signupScreen,
        page: () => const SignupScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: RouteNames.otpScreen,
        page: () => const OtpScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: RouteNames.forgotPasswordScreen,
        page: () => const ForgotPasswordScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: RouteNames.baseScreen,
        page: () => const BaseScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: RouteNames.homeScreen,
        page: () => const HomeScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: RouteNames.productDetailsScreen,
        page: () => const ProductDetailsScreen(),
        transition: Transition.noTransition),

  ];
}
