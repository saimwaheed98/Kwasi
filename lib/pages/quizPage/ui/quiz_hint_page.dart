import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kwasi/widgets/gesture_container.dart';
import 'package:provider/provider.dart';
import '../../../core/data/provider/auth_provider.dart';
import '../../../utils/colors.dart';
import '../../../widgets/app_bar.dart';
import '../../home/presentation/provider/languges_provider.dart';
import '../../learning_words/provider/learning_word_provider.dart';
import '../../learning_words/ui/learnings_words_page.dart';
import '../../navBar/provider/bottom_bar_provider.dart';
import '../widgets/quiz_hint_container.dart';
import '../widgets/language_container.dart';

class FishPage extends StatefulWidget {
  const FishPage({super.key});

  @override
  State<FishPage> createState() => _FishPageState();
}

class _FishPageState extends State<FishPage> {
  @override
  void initState() {
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      var provider = Provider.of<LangugesProvider>(context,listen: false);
      provider.generateIndex();
      provider.generateQuestion( );
      provider.getQuizName( );

      Provider.of<LearningWordProvider>(context, listen: false)
          .generateQuestionIndex();
      Provider.of<LearningWordProvider>(context, listen: false)
          .getQuestionName(context);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LangugesProvider>(context,listen: false);
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(116),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Consumer<LearningWordProvider>(builder: (context, provider, child) {
                log("name ${provider.questionName}");
                return HomeAppBar(
                    appBarText: provider.quizName,
                    textColor: AppColors.blackColor);
              }),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
            const SizedBox(
              height: 40,
            ),
            const LanguageContainer(),
            const SizedBox(
              height: 30,
            ),
            const FishContainer(),
            SizedBox(height: MediaQuery.of(context).size.height*.04,),
            GestureContainer(onPressed: () {
              var languageProvider = Provider.of<LearningWordProvider>(context,listen: false);
              languageProvider.changeQuestionName(provider.questionName);
              languageProvider.getTheQuizAnswer(provider.quizAnswer);
              languageProvider.getTheQuizOptions();
              Provider.of<NaBarProvider>(context,listen: false).changeScreen(context);
            }, buttonText: 'Got It', heroTag: ''),
          ]),
        ),
      ),
    );
  }
}
