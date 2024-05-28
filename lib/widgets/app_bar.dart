import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/core/data/provider/auth_provider.dart';
import 'package:kwasi/pages/navBar/provider/bottom_bar_provider.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget {
  final String appBarText;
  final Color textColor;
  final Function()? onPressed;
  const HomeAppBar(
      {super.key, required this.appBarText, required this.textColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NaBarProvider>(context);
    return AppBar(
      foregroundColor: AppColors.whiteColor,
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
      leading: IconButton(
          onPressed: onPressed ?? () {
            AutoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.blackColor,
          )),
      title: AppTextStyle(
        text: appBarText,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
      actions: [
        InkWell(
          onTap: () {
            provider.setIndex(2);
          },
          child: Consumer<AuthProvider>(builder: (context, prov, child) {
            return Container(
              margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * .04),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor.withOpacity(0.6),
                image: prov.userDetail.photoURL.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(prov.userDetail.photoURL))
                    : null,
              ),
              child: AppTextStyle(
                text: prov.userDetail.photoURL.isEmpty
                    ? prov.userDetail.username
                    : "",
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            );
          }),
        ),
      ],
    );
  }
}
