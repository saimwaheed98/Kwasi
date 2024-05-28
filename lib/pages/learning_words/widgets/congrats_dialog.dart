
import 'package:flutter/material.dart';
import 'package:kwasi/pages/learning_words/provider/learning_word_provider.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:kwasi/widgets/gesture_container.dart';
import 'package:provider/provider.dart';

class CongratsDialog extends StatelessWidget {
  const CongratsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LearningWordProvider>(context);
    return  Dialog(
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      insetPadding: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            const AppTextStyle(text: "Congratulations", fontSize: 24,color: AppColors.blackColor, fontWeight: FontWeight.bold),
            const SizedBox(
              height: 8,
            ),
            const AppTextStyle(text: "You have completed ten words in a row!", fontSize: 18,color: AppColors.blackColor,  fontWeight: FontWeight.bold),
            const SizedBox(
              height: 12,
            ),
            GestureContainer(onPressed: () {
              provider.changeQuizValue();
              Navigator.of(context).pop();
            }, buttonText: "Reset", heroTag: "")
          ],
        ),
      ),
    );
  }
}
