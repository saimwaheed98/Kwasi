import 'dart:developer';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/pages/learning_words/provider/learning_word_provider.dart';
import 'package:kwasi/pages/learning_words/widgets/answer_bottom_sheet.dart';
import 'package:kwasi/pages/learning_words/widgets/quizes_container.dart';
import 'package:kwasi/pages/navBar/provider/bottom_bar_provider.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/utils/images.dart';
import 'package:kwasi/widgets/app_bar.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:kwasi/widgets/gesture_container.dart';
import 'package:provider/provider.dart';

@RoutePage()

class LearningWordsPage extends StatelessWidget {
  const LearningWordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LearningWordProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Consumer<LearningWordProvider>(builder: (context, provider, child) {
              log("name ${provider.questionName}");
              return HomeAppBar(
                  appBarText: provider.quizName,
                  onPressed: () {
                    Provider.of<NaBarProvider>(context,listen: false).changeToFishScreen(context);
                  },
                  textColor: AppColors.blackColor);
            }),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Consumer<LearningWordProvider>(
                  builder: (context,provider,child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppTextStyle(text: "${provider.remainingValue.round()} IN A ROW" ,
                            color: AppColors.blackColor,
                            fontSize: 15, fontWeight: FontWeight.w600),
                        const SizedBox(
                          height: 5,
                        ),
                        LinearProgressIndicator(
                          backgroundColor: AppColors.greyColor,
                          color: AppColors.primaryColor,
                          minHeight: 10,
                          value: provider.quizValue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ],
                    );
                  }
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<LearningWordProvider>(
                    builder: (context, provider, child) {
                  return RichText(text: TextSpan(
                    children: [
                       TextSpan(
                        text: "${AppLocalizations.of(context)!.howDoWeSay} ",
                      ),
                      TextSpan(
                        text: provider.questionName,
                        style: const TextStyle(
                          fontFamily:'oktaRound',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff9A1D2B),),
                      ),
                       TextSpan(
                        text: " ${AppLocalizations.of(context)!.dan} ${provider.quizName}?",
                      ),
                    ],
                    style: const TextStyle(
                      fontFamily:'oktaRound',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,),
                  ));
                }),
                const SizedBox(
                  height: 15,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:
                        List.generate(provider.quizOptions.length, (index) {
                      return QuizContainer(
                        title: provider.quizOptions[index],
                        isSelected:
                            provider.isSelected == provider.quizOptions[index],
                        onChanged: (value) {
                          provider.isChangeUi = false;
                          provider.selectWord(provider.quizOptions[index]);
                        },
                      );
                    })),
                const SizedBox(
                  height: 40,
                ),
                  Consumer<LearningWordProvider>(
                      builder: (context, provider, child) {
                    return provider.isSelected.isNotEmpty && provider.isChangeUi  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset( provider.isAnswerCorrected
                            ? AppImages.successIcon : AppImages.failIcon ),
                        const SizedBox(
                          width: 10,
                        ),
                        AppTextStyle(
                          text: provider.isAnswerCorrected
                              ? 'Amazing'
                              :  'Oops! Not Quite' ,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: provider.isAnswerCorrected
                              ? AppColors.primaryColor
                              :  const Color(0xffFF6C6C),
                        )
                      ],
                    ) : const SizedBox();
                  }),
                const SizedBox(
                  height: 56,
                ),
                Consumer<LearningWordProvider>(
                  builder: (context,provider,child) {
                    return GestureContainer(
                        onPressed: () {
                          if(provider.isAnswerCorrected){
                            provider.isAnswerCorrected = false;
                            provider.isChangeUi = false;
                            Provider.of<NaBarProvider>(context,listen: false).changeToFishScreen(context);
                          }else{
                            provider.changFirstSelection(true);
                            provider.checkAnswer(context);
                            if(provider.quizValue > 0.9){
                              provider.restartQuizValue();
                              showModalBottomSheet(context: context, builder: (context) {
                                return const AnswerBottomSheet();
                              },);
                            }
                          }
                        },
                        buttonText: provider.firstTimeSelect == false && provider.isChangeUi == false ? "Verify" : provider.isAnswerCorrected ? 'Next' : "Try Again" ,
                        // buttonColor: provider.isCorrect
                        //     ? AppColors.primaryColor
                        //     : provider.isChangeUi
                        //         ? AppColors.primaryColor
                        //         : const Color(0xffFF6C6C),
                        heroTag: '');
                  }
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
