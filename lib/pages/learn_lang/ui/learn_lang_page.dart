import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/pages/learn_lang/provider/learn_lang_provider.dart';
import 'package:kwasi/pages/learn_lang/widgets/learn_lang_widget.dart';
import 'package:kwasi/routes/routes_imports.gr.dart';
import 'package:kwasi/utils/images.dart';
import 'package:kwasi/utils/screen_sizes.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:kwasi/widgets/gesture_container.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class LearnLangPage extends StatelessWidget {
  const LearnLangPage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LearnLangProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              Center(
                child: Image.asset(AppImages.learnLang,
                    height: 244, width: getWidth(context) * 0.8),
              ),
              const SizedBox(
                height: 50,
              ),
                AppTextStyle(
                  text: AppLocalizations.of(context)!.iWantToLearn,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              const SizedBox(
                height: 35,
              ),
              Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runSpacing: 19,
                  spacing: 11,
                  children: List.generate(provider.languages.length, (index) {
                    var data = provider.languages[index];
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LearnLanguageWidget(
                          containerText: data,
                        ),
                      ],
                    );
                  })),
              const SizedBox(
                height: 60,
              ),
              GestureContainer(
                  onPressed: () async{
                    if( provider.selectedLanguage!=''){
                       AutoRouter.of(context).push(const SelectQuizPageRoute());
                    await provider.storeSelectedLanguage(context);
                    }
                   
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
