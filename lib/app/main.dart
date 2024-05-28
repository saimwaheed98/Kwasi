import 'package:flutter/material.dart';
import 'package:kwasi/app/my_app.dart';
import 'package:kwasi/core/initialization/app_intializer.dart';
import 'package:kwasi/pages/home/presentation/provider/languges_provider.dart';
import 'package:kwasi/pages/profile/provider/profile_pick_provider.dart';
import 'package:provider/provider.dart';

import '../core/data/provider/auth_provider.dart';
import '../localization/provider/change_lang_provider.dart';
import '../pages/choose_type/presentation/provider/choose_type_provider.dart';
import '../pages/create_profile/presentation/provider/create_profile_provider.dart';
import '../pages/learn_lang/provider/learn_lang_provider.dart';
import '../pages/learning_words/provider/learning_word_provider.dart';
import '../pages/navBar/provider/bottom_bar_provider.dart';
import '../pages/onBoarding/presentation/provider/google_sign_in_provider.dart';

void main() async {
  await AppInitializer.init();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CreateProfileProvider(),
        ),
        ChangeNotifierProvider(create: (context) => LearnLangProvider()),
        ChangeNotifierProvider(create: (context) => ChooseTypeProvider()),
        ChangeNotifierProvider(
          create: (context) => NaBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LearningWordProvider(),
        ),
        ChangeNotifierProvider(create: (context) => LangugesProvider()),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CreateProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
        ),
        ChangeNotifierProvider(create: (context) => ChangeLangProvider(),),
        ChangeNotifierProvider(create: (context) => ProfilePickProvider())
      ],
      child: MyApp()));
}
