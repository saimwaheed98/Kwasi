import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/pages/home/presentation/widgets/choose_language_container.dart';
import 'package:kwasi/pages/home/presentation/widgets/write_lang_container.dart';
import 'package:kwasi/utils/colors.dart';
import 'package:kwasi/widgets/app_bar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(116),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              HomeAppBar(
                  appBarText: 'Kwasi', textColor: AppColors.primaryColor),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            SizedBox(
              height: 40,
            ),
            ChooseLanguageContainer(),
            SizedBox(
              height: 30,
            ),
            WriteLangContainer(),
          ]),
        ),
      ),
    );
  }
}
