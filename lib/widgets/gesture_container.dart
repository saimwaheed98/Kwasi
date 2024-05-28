import 'package:flutter/material.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/widgets/app_text_style.dart';

class GestureContainer extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  final Color? buttonColor;
  final String heroTag;
  final double? radius;
  final bool isLoading;
  final Widget? icon;
  const GestureContainer(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.buttonColor,
      required this.heroTag,
      this.radius,
      this.isLoading = false,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 10,
            maximumSize: const Size(double.infinity, 57),
            backgroundColor: buttonColor ?? AppColors.primaryColor,
            minimumSize: const Size(double.infinity, 57),
            foregroundColor: AppColors.whiteColor.withOpacity(0.4),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shadowColor: AppColors.greyColor.withOpacity(0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 30),
            ),
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
                    icon ?? const SizedBox(),
                    if (icon != null)
                      const SizedBox(
                        width: 10,
                      ),
                    AppTextStyle(
                      text: buttonText,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteColor,
                    ),
                  ],
                )),
    );
  }
}
