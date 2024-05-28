import 'package:flutter/material.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kwasi/widgets/app_text_style.dart';

class AgeChooseDrop extends StatelessWidget {
  final TextEditingController controller;
  const AgeChooseDrop({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: DropdownMenu(
          controller: controller,
          expandedInsets: const EdgeInsets.all(0),
          hintText: AppLocalizations.of(context)!.selectYourAge,
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
                value: '15',
                label: '10 - 20 years',
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.whiteColor)),
                labelWidget: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    AppTextStyle(
                        text: '10 - 20 years',
                        fontSize: 18,
                        color: AppColors.blackColor.withOpacity(0.8),
                        fontWeight: FontWeight.w600),
                  ],
                )),
            DropdownMenuEntry(
                value: '25',
                label: '20 - 30 years',
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        AppColors.greyColor.withOpacity(0.4))),
                labelWidget: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    AppTextStyle(
                        text: '20 - 30 years',
                        fontSize: 18,
                        color: AppColors.blackColor.withOpacity(0.8),
                        fontWeight: FontWeight.w600),
                  ],
                )),
                DropdownMenuEntry(
                value: '35',
                label: '30 - 40 years',
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        AppColors.greyColor.withOpacity(0.4))),
                labelWidget: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    AppTextStyle(
                        text: '30 - 40 years',
                        fontSize: 18,
                        color: AppColors.blackColor.withOpacity(0.8),
                        fontWeight: FontWeight.w600),
                  ],
                )),
                DropdownMenuEntry(
                value: '45',
                label: '40 - 50 years',
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        AppColors.greyColor.withOpacity(0.4))),
                labelWidget: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    AppTextStyle(
                        text: '40 - 50 years',
                        fontSize: 18,
                        color: AppColors.blackColor.withOpacity(0.8),
                        fontWeight: FontWeight.w600),
                  ],
                )),
                DropdownMenuEntry(
                value: '55',
                label: '50 to older years',
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        AppColors.greyColor.withOpacity(0.4))),
                labelWidget: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    AppTextStyle(
                        text: '50 to older years',
                        fontSize: 18,
                        color: AppColors.blackColor.withOpacity(0.8),
                        fontWeight: FontWeight.w600),
                  ],
                )),
                  
          ]),
    );
  }
}
