import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/pages/choose_type/presentation/widgets/choose_type_widget.dart';
import 'package:kwasi/routes/routes_imports.gr.dart';
import 'package:kwasi/utils/images.dart';
import 'package:kwasi/utils/screen_sizes.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:kwasi/widgets/gesture_container.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../provider/choose_type_provider.dart';
import '../widgets/coming_soon.dart';

@RoutePage()
class SelectQuizPage extends StatelessWidget {
  const SelectQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChooseTypeProvider>(context);
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
                child: Image.asset(AppImages.selectQuiz,
                    height: 244, width: getWidth(context) * 0.8),
              ),
              const SizedBox(
                height: 50,
              ),
                AppTextStyle(
                  text: AppLocalizations.of(context)!.iAmInterstedIn,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              const SizedBox(
                height: 39,
              ),
                ChooseQuizType(
                  containerText:  AppLocalizations.of(context)!.translation,
                  containerImage: AppImages.translationImg),
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ChooseQuizType(
                    containerText:  AppLocalizations.of(context)!.learning,
                    containerImage: AppImages.learningWords),
              ),
              ChooseQuizType(
                  containerText:   AppLocalizations.of(context)!.journey,
                  containerImage: AppImages.translationImg),
              const SizedBox(
                height: 49,
              ),
              GestureContainer(
                  onPressed: () async {
                    if(provider.selectedType == AppLocalizations.of(context)!.journey){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ComingSoon(),));
                    }else{
                      AutoRouter.of(context).push(const BottomNavBarRoute());
                      provider.saveType(context);
                    }
                  },
                  buttonText:  AppLocalizations.of(context)!.buttonContinue,
                  heroTag: 'language')
            ],
          ),
        ),
      ),
    );
  }
}
