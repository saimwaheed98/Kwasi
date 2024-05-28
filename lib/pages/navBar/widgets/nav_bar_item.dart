import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../provider/bottom_bar_provider.dart';

class BottomBarItem extends StatelessWidget {
  final String icon;
  final String? unselectedIcon;
  final int index;
  const BottomBarItem(
      {super.key,
      required this.icon,
      required this.index,
      this.unselectedIcon});

  @override
  Widget build(BuildContext context) {
    return Consumer<NaBarProvider>(builder: (context, provider, child) {
      return Container(
        height: 45,
        width: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor.withOpacity(0.15),
        ),
        child: IconButton(
            onPressed: () {
              provider.setIndex(index);
            },
            icon: index == 2
                ? Icon(
                    Icons.person,
                    color: index == provider.navIndex
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                  )
                : SvgPicture.asset(index == provider.navIndex ? icon : unselectedIcon ?? "",)),
      );
    });
  }
}
