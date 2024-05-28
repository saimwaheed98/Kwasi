import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kwasi/pages/home/presentation/provider/languges_provider.dart';
import 'package:kwasi/pages/navBar/provider/bottom_bar_provider.dart';
import 'package:kwasi/pages/navBar/widgets/nav_bar_item.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/utils/images.dart';
import 'package:provider/provider.dart';

@RoutePage()
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  void initState() {
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {{
      var getLangugesProvider =
      Provider.of<LangugesProvider>(context, listen: false);
      getLangugesProvider.getLangugesFromDB();
    }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NaBarProvider>(builder: (context, provider, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteColor,
        body: Center(
            child: provider.screens(context)[provider.navIndex]),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomAppBar(
            elevation: 6,
            color: AppColors.primaryColor.withOpacity(0.46),
            child: Container(
              height: 60.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  BottomBarItem(icon: AppImages.homeIconSel,
                      unselectedIcon: AppImages.homeIcon,
                      index: 0),
                  BottomBarItem(icon: AppImages.learningWordIconSel,
                      unselectedIcon: AppImages.learningWordIcon,
                      index: 1),
                  BottomBarItem(
                      icon: "",
                      index: 2),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
