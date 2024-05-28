import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kwasi/pages/learning_words/provider/learning_word_provider.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:kwasi/widgets/gesture_container.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AnswerBottomSheet extends StatelessWidget {
  const AnswerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 35,),
                AppTextStyle(
                text: AppLocalizations.of(context)!.congratulation,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),

              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Provider.of<LearningWordProvider>(context,listen: false).restartQuizValue();
                  AutoRouter.of(context).pop();
                },
              ),
            ],
          ),
          Divider(
            color: AppColors.greyColor.withOpacity(0.5),
            thickness: 1,
          ),
          const SizedBox(height: 20.0),

          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
                Container(
            alignment: Alignment.center,
            child:  AppTextStyle(textAlign:TextAlign.center ,
              text: AppLocalizations.of(context)!.congratsInARow,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
                Text("♥️♥️♥️",style: TextStyle(fontSize: MediaQuery.of(context).size.width*.08),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: GestureContainer(
                onPressed: () {
                  Provider.of<LearningWordProvider>(context,listen: false).restartQuizValue();
                  Navigator.of(context).pop();
                }, buttonText: AppLocalizations.of(context)!.buttonContinue, heroTag: ''),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
