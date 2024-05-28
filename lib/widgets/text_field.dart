import 'package:flutter/material.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/widgets/app_text_style.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String fieldName;
  final TextInputType? keyboard;
  LoginTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.fieldName,
      this.keyboard});

  final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextStyle(
          text: fieldName,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Card(
          elevation: 5,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboard,
            keyboardAppearance: Brightness.dark,
            cursorColor: AppColors.primaryColor,
            cursorRadius: const Radius.circular(30),
            style: TextStyle(
                color: AppColors.blackColor.withOpacity(0.7),
                fontSize: 18,
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              fillColor: AppColors.whiteColor,
              filled: true,
              constraints: const BoxConstraints(
                maxHeight: 52,
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
              border: border,
              enabledBorder: border,
              disabledBorder: border,
              errorBorder: border,
            ),
          ),
        ),
      ],
    );
  }
}
