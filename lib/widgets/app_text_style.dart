import 'package:flutter/material.dart';
import 'package:kwasi/utils/colors.dart';

class AppTextStyle extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final String? fontFamily;
  final int? maxLines;
  const AppTextStyle(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      this.color = AppColors.whiteColor,
      this.overflow,
      this.textAlign,
      this.fontFamily,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
          fontFamily: fontFamily ?? 'oktaRound',
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          overflow: overflow),
    );
  }
}

const TextStyle popinsM = TextStyle(
  fontFamily: 'oktaRound',
  fontSize: 22,
  fontWeight: FontWeight.w500,
  color: AppColors.whiteColor,
);

const TextStyle popinsR = TextStyle(
  fontFamily: 'oktaRound',
  fontSize: 22,
  fontWeight: FontWeight.w500,
  color: AppColors.whiteColor,
);
