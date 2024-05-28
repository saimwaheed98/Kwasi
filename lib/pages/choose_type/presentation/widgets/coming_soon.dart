import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/widgets/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../utils/colors.dart';
import '../../../../widgets/app_text_style.dart';
import '../../../../widgets/gesture_container.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*.02,left: MediaQuery.of(context).size.width*.02,bottom:  MediaQuery.of(context).size.width*.03 ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HomeAppBar(
                appBarText:AppLocalizations.of(context)!.journey,
                textColor: AppColors.blackColor),
             AppTextStyle(textAlign:TextAlign.center ,
              text:  AppLocalizations.of(context)!.comingSoon,
              fontSize: MediaQuery.of(context).size.width*.1,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: GestureContainer(
                  onPressed: () {
                    Navigator.of(context).pop();
                  }, buttonText: AppLocalizations.of(context)!.back, heroTag: ''),
            ),
          ],
        ),
      ),
    );
  }
}
