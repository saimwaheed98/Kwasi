import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/pages/language/presentation/widget/choose_language.dart';
import 'package:kwasi/routes/routes_imports.gr.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/utils/images.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:kwasi/widgets/gesture_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class SelectLanguagePage extends StatelessWidget {
    SelectLanguagePage({super.key});

  final controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(AppImages.languageImg),
                Center(
                child: AppTextStyle(
                    text: AppLocalizations.of(context)!.choosePreferdLang,
                    fontSize: 20,
                    textAlign: TextAlign.center,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 50,
              ),
                AppTextStyle(
                text: AppLocalizations.of(context)!.language,
                fontSize: 14,
                fontWeight: FontWeight.w200,
                color: AppColors.blackColor,
              ),
              const SizedBox(
                height: 10,
              ),
              ChooseLanguage(controller: controller),
              const SizedBox(
                height: 52,
              ),
              GestureContainer(
                  onPressed: () {
                    AutoRouter.of(context).push(const LearnLangPageRoute());
                  },
                  buttonText: AppLocalizations.of(context)!.buttonContinue,
                  heroTag: 'language')
            ],
          ),
        ),
      ),
    );
  }
}
