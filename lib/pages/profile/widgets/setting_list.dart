import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/core/data/datasources/auth.dart';
import 'package:kwasi/pages/profile/widgets/language_dialouge.dart';
import 'package:kwasi/routes/routes_imports.gr.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/utils/screen_sizes.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../navBar/provider/bottom_bar_provider.dart';

class SettingList extends StatelessWidget {
  const SettingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: getWidth(context),
        padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff053405).withOpacity(0.1),
              blurRadius: 124,
              offset: const Offset(0, 34),
            ),
          ],
        ),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (context) {
                    return const LanguageDialouge();
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    AppTextStyle(
                      text: AppLocalizations.of(context)!.changeLang,
                      fontSize: 16,
                      color: const Color(0xff5D5555),
                      fontWeight: FontWeight.w500),
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const LanguageDialouge();
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.primaryColor,
                        size: 13,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Divider(
              color: const Color(0xffE5E5E5).withOpacity(0.3),
              thickness: 1,
            ),
            const SizedBox(height: 14),
            InkWell(
              onTap: () async {
                var provider = Provider.of<NaBarProvider>(context,listen: false);
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("userId", "");
                Auth.auth.signOut().then((value) {
                  AutoRouter.of(context).pushAndPopUntil(
                    const OnBoardingPageRoute(),
                    predicate: (route) => false,
                  );
                  provider.setIndex(0);
                });
              },
              child:   Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AppTextStyle(
                      text: AppLocalizations.of(context)!.logOut,
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
