import 'package:flutter/material.dart';
import 'package:kwasi/localization/provider/change_lang_provider.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:provider/provider.dart';

class ChooseLanguage extends StatelessWidget {
  final TextEditingController controller;
  const ChooseLanguage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangeLangProvider>(context);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: DropdownMenu(
          controller: controller,
          expandedInsets: const EdgeInsets.all(0),
          hintText: 'Choose Language',
          textStyle: popinsR.copyWith(
            fontSize: 14,
            color: AppColors.blackColor.withOpacity(0.5),
            fontWeight: FontWeight.w400,
          ),
          trailingIcon: const Icon(
            Icons.arrow_drop_down_rounded,
            size: 35,
            color: AppColors.blackColor,
          ),
          onSelected: (value){
            provider.changeLanguage(Locale(value ?? "en"));
          },
          inputDecorationTheme: InputDecorationTheme(
              fillColor: AppColors.whiteColor,
              filled: true,
              hintStyle: popinsR.copyWith(
                fontSize: 14,
                color: AppColors.blackColor.withOpacity(0.5),
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none)),
          dropdownMenuEntries: [
            DropdownMenuEntry(
                value: 'en',
                label: 'English',
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.whiteColor)),
                labelWidget: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    AppTextStyle(
                        text: 'English',
                        fontSize: 18,
                        color: AppColors.blackColor.withOpacity(0.8),
                        fontWeight: FontWeight.w600),
                  ],
                )),
            DropdownMenuEntry(
                value: 'fr',
                label: 'French',
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        AppColors.greyColor.withOpacity(0.4))),
                labelWidget: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    AppTextStyle(
                        text: 'French',
                        fontSize: 18,
                        color: AppColors.blackColor.withOpacity(0.8),
                        fontWeight: FontWeight.w600),
                  ],
                )),
                  
          ]),
    );
  }
}
