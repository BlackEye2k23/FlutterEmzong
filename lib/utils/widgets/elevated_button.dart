import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.pressCallBack,
    required this.buttonHeight,
    required this.buttonWidth,
  }) : super(key: key);
  final String text;
  final VoidCallback pressCallBack;
  final double buttonHeight;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressCallBack,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(buttonWidth, buttonHeight),
      ),
      child: AutoSizeText(
        text,
        style: GoogleFonts.roboto(
            fontSize: 4.sw,fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
