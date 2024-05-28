import 'package:flutter/material.dart';
import 'package:kwasi/pages/learn_lang/provider/learn_lang_provider.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:provider/provider.dart';

class LearnLanguageWidget extends StatelessWidget {
  final String containerText;
  const LearnLanguageWidget({super.key, required this.containerText});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LearnLangProvider>(context);
    return InkWell(
      highlightColor: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(20),
      splashColor: AppColors.primaryColor,
      splashFactory: InkSplash.splashFactory,
      onTap: () {

        ////update add language
        provider.addLang(containerText);

      },
      child: Container(
        height: 36,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
        decoration: BoxDecoration(
            border: provider.selectedLanguage==containerText? Border.all(color: AppColors.borderColor)
             : null,

            borderRadius: BorderRadius.circular(20),
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ]),
        child: AppTextStyle(
          text: containerText,
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: AppColors.blackColor.withOpacity(0.8),
        ),
      ),
    );
  }
}
