import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kwasi/pages/learn_lang/provider/learn_lang_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../widgets/app_text_style.dart';
import '../provider/languges_provider.dart';

class MainLangContainer extends StatefulWidget {
  final Function(dynamic)? onSelected;
  const MainLangContainer({super.key,required this.onSelected});

  @override
  State<MainLangContainer> createState() => _MainLangContainerState();
}

class _MainLangContainerState extends State<MainLangContainer> {
  @override
  initState() {
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      var provider = Provider.of<LangugesProvider>(context, listen: false);
      provider.addLanguage("English");
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
        onSelected: widget.onSelected,

        //     (value) {
        //   provider.addLanguage(value);
        //   provider.generateQuestion();
        //   provider.getQuizName();
        // },
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor,
              ),
              child: provider.selectedLanguages == "French"
                  ? Image.asset(
                      AppImages.frenchFlag,
                      fit: BoxFit.cover,
                      height: 54,
                      width: 54,
                    )
                  : provider.selectedLanguages == "English"
                      ? Image.asset(
                          AppImages.englishFlag,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          AppImages.loaclFlag,
                          fit: BoxFit.cover,
                        ),
            ),
            AppTextStyle(
              text: provider.selectedLanguages,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ],
        ),
        itemBuilder: (context) {
          return provider.selectedLang.map((e) => entry(e)).toList();
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
