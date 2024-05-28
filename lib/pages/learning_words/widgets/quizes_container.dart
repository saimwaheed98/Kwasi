import 'package:flutter/material.dart';
import 'package:kwasi/pages/learning_words/provider/learning_word_provider.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:provider/provider.dart';

class QuizContainer extends StatelessWidget {
  final String title;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  const QuizContainer({
    required this.title,
    required this.isSelected,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LearningWordProvider>(builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: RadioListTile(
              value: true,
              groupValue: isSelected,
              title: AppTextStyle(
                text: title,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
              activeColor: AppColors.blackColor,
              onChanged: onChanged,
            ),
          ),
        ),
      );
    });
  }
}
