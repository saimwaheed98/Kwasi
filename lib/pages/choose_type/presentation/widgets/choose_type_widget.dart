import 'package:flutter/material.dart';
import 'package:kwasi/pages/choose_type/presentation/provider/choose_type_provider.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:provider/provider.dart';

class ChooseQuizType extends StatelessWidget {
  final String containerText;
  final String containerImage;
  const ChooseQuizType(
      {super.key, required this.containerText, required this.containerImage});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChooseTypeProvider>(context);
    return GestureDetector(
      onTap: () {
        provider.selectType(containerText);
      },
      child: Card(
        elevation: 5,
        shadowColor: AppColors.greyColor.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: provider.selectedType == containerText
                  ? Border.all(color: AppColors.borderColor, width: 1)
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(containerImage),
                const SizedBox(
                  width: 22,
                ),
                AppTextStyle(
                  text: containerText,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor.withOpacity(0.8),
                )
              ],
            )),
      ),
    );
  }
}
