import 'package:flutter/material.dart';

class AppColors{
  static const Color primaryColor = Color(0xFF06adaf);
  static const Color primarySecondaryColor = Color(0xFFfe9900);
  static const Color textColorBlack = Colors.black;
  static const Color textColorWhite = Colors.white;
  static const Color transparentColor = Colors.transparent;


  getBaseAppColor(){
    const themeColor = MaterialColor(
      0xFF06adaf,
      <int, Color>{
        50: Color(0xFF06adaf),
        100: Color(0xFF06adaf),
        200: Color(0xFF06adaf),
        300: Color(0xFF06adaf),
        400: Color(0xFF06adaf),
        500: Color(0xFF06adaf),
        600: Color(0xFF06adaf),
        700: Color(0xFF06adaf),
        800: Color(0xFF06adaf),
        900: Color(0xFF06adaf),
      },
    );
    return themeColor;
  }


}
