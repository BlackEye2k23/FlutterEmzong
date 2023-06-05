import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
    required this.pressCallBack,
    required this.textColor,
    required this.textSize
  }) : super(key: key);
  final String text;
  final VoidCallback pressCallBack;
  final Color textColor;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: pressCallBack,
      child: AutoSizeText(
        text,
        style: GoogleFonts.roboto(
            fontSize: textSize.sw,fontWeight: FontWeight.bold,color: textColor
        ),
      ),
    );
  }
}
