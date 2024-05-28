import 'package:flutter/material.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/widgets/app_text_style.dart';

class LoginContainer extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  final Color? buttonColor;
  final String containerImg;
  final String heroTag;
  final BorderSide? border;
  final double? radius;
  final bool isLoading;
  final Widget? icon;
  const LoginContainer(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.buttonColor,
      required this.heroTag,
      this.radius,
      this.isLoading = false,
      this.icon,
      required this.containerImg,
      this.border});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 10,
            maximumSize: const Size(double.infinity, 57),
            backgroundColor: buttonColor ?? AppColors.whiteColor,
            minimumSize: const Size(double.infinity, 57),
            foregroundColor: AppColors.whiteColor,
            surfaceTintColor: AppColors.whiteColor,
            disabledBackgroundColor: AppColors.whiteColor,
            disabledForegroundColor: AppColors.whiteColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shadowColor: AppColors.greyColor.withOpacity(0.8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 30),
                side: border ?? BorderSide.none),
          ),
          child: isLoading == true
              ? const SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primaryColor,
                    backgroundColor: AppColors.whiteColor,
                  ))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(containerImg),
                    const SizedBox(
                      width: 7,
                    ),
                    AppTextStyle(
                      text: buttonText,
                      color: AppColors.blackColor.withOpacity(0.8),
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
