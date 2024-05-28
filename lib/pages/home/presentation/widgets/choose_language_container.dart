import 'package:flutter/material.dart';
import 'package:kwasi/pages/home/presentation/provider/languges_provider.dart';
import 'package:kwasi/pages/home/presentation/widgets/lang_pop_up_menue.dart';
import 'package:kwasi/pages/home/presentation/widgets/main_lang_container.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/utils/images.dart';
import 'package:provider/provider.dart';

class ChooseLanguageContainer extends StatelessWidget {
  const ChooseLanguageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LangugesProvider>(
      builder: (context,provider,child) {
        return Card(
          elevation: 7,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 MainLangContainer(
                  onSelected: (value) {
                    provider.addLanguage(value);
                    provider.changeLanguage();
                  },
                ),
                Column(
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      child: Container(
                        height: 70,
                        width: 70,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteColor,
                        ),
                        child: IconButton(
                            onPressed: () {
                              provider.changeThePosition();
                            },
                            icon: Image.asset(AppImages.changeLang)),
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                  ],
                ),
                const ChooseLanguagesPopUp(),
              ],
            ),
          ),
        );
      }
    );
  }
}
