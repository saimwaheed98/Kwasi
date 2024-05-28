import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kwasi/core/data/provider/auth_provider.dart';
import 'package:kwasi/pages/learning_words/provider/learning_word_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../widgets/app_text_style.dart';
import '../../../learn_lang/provider/learn_lang_provider.dart';
import '../provider/languges_provider.dart';

class ChooseLanguagesPopUp extends StatefulWidget {
  const ChooseLanguagesPopUp({super.key});

  @override
  State<ChooseLanguagesPopUp> createState() => _ChooseLanguagesPopUpState();
}

class _ChooseLanguagesPopUpState extends State<ChooseLanguagesPopUp> {
  @override
  void initState() {
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      var provider = Provider.of<LangugesProvider>(context, listen: false);
      var authProvider = Provider.of<AuthProvider>(context, listen: false);
      var selectedlanguage =
          Provider.of<LearnLangProvider>(context, listen: false)
              .selectedLanguage;
      selectedlanguage;
      provider.addTranslatedLanguage(
          authProvider.userDetail.wantToLearn.isNotEmpty
              ? authProvider.userDetail.wantToLearn[1]
              : selectedlanguage,
          context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LangugesProvider>(builder: (context, provider, child) {
      return PopupMenuButton(
        offset: const Offset(0, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        elevation: 10,
        shadowColor: AppColors.primaryColor.withOpacity(0.6),
        onSelected: (value) {
          provider.addTranslatedLanguage(value, context);
          provider.getQuizName();
          Provider.of<LearningWordProvider>(context,listen: false).getQuizName(context);
          
        },
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor,
              ),
              child: provider.selectedTranslatedLanguages == "French"
                  ? Image.asset(
                      AppImages.frenchFlag,
                      fit: BoxFit.cover,
                      height: 54,
                      width: 54,
                    )
                  : provider.selectedTranslatedLanguages == "English"
                      ? Image.asset(
                          AppImages.englishFlag,
                          fit: BoxFit.cover,
                          height: 54,
                          width: 54,
                        )
                      : Image.asset(
                          AppImages.loaclFlag,
                          fit: BoxFit.cover,
                        ),
            ),
            AppTextStyle(
              text: provider.selectedTranslatedLanguages,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ],
        ),
        itemBuilder: (context) {
          return provider.translatedLanguages.map((e) => entry(e)).toList();
        },
      );
    });
  }

  PopupMenuEntry entry(String name) {
    return PopupMenuItem(
        value: name,
        child: Row(
          children: [
            const Icon(Icons.language),
            const SizedBox(width: 10),
            AppTextStyle(
              text: name,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ],
        ));
  }
}
