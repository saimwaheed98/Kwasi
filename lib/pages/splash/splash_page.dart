import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kwasi/core/data/datasources/auth.dart';
import 'package:kwasi/core/data/provider/auth_provider.dart';
import 'package:kwasi/pages/choose_type/presentation/widgets/choose_type_widget.dart';
import 'package:kwasi/pages/language/presentation/ui/select_language.dart';
import 'package:kwasi/routes/routes_imports.gr.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/utils/images.dart';
import 'package:kwasi/widgets/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../learning_words/provider/learning_word_provider.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
    var learningWords = Provider.of<LearningWordProvider>(context, listen: false);
    learningWords.getWords();
    });
  }

  _navigateToLogin() async {
    var provider = Provider.of<AuthProvider>(context, listen: false);
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String userId = sp.getString('userId') ?? Auth.user?.uid ?? "";
    if (userId.isNotEmpty) {
      provider.getSelfInfo();
    }
    Future.delayed(const Duration(seconds: 3), () {
      if (userId.isEmpty) {
        AutoRouter.of(context).pushAndPopUntil(
            predicate: (route) => false, const OnBoardingPageRoute());
      } else {
        AutoRouter.of(context).pushAndPopUntil(
            predicate: (route) => false, const LearnLangPageRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                AppImages.splashC1,
                height: 168,
              )),
          Positioned(
              top: 0,
              left: 0,
              child: Transform.rotate(
                  angle: 109.95, child: Image.asset(AppImages.splashC2))),
          Center(
            child: Container(
              height: 148,
              width: 148,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.3),
                        blurRadius: 28,
                        spreadRadius: 10)
                  ]),
              child: const AppTextStyle(
                  text: 'Kwasi', fontSize: 32, fontWeight: FontWeight.w700),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Transform.rotate(
                  angle: 110, child: Image.asset(AppImages.splashC1))),
          Positioned(
              bottom: 0, right: 0, child: Image.asset(AppImages.splashC2)),
        ],
      ),
    );
  }
}
