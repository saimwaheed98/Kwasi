
import 'package:flutter/material.dart';
import 'package:kwasi/pages/home/presentation/ui/home_page.dart';
import 'package:kwasi/pages/learning_words/ui/learnings_words_page.dart';
import 'package:kwasi/pages/profile/ui/profile_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../choose_type/presentation/provider/choose_type_provider.dart';
import '../../quizPage/ui/quiz_hint_page.dart';

class NaBarProvider extends ChangeNotifier {
  int _navIndex = 0;
  int get navIndex => _navIndex;

  void setIndex(int index) {
    _navIndex = index;
    notifyListeners();
  }

  changeScreen(BuildContext context){
    screens(context)[_navIndex] = const LearningWordsPage();
    notifyListeners();
  }

  changeToFishScreen(BuildContext context){
    screens(context)[_navIndex] = const FishPage();
    notifyListeners();
  }

  List<Widget> screens(BuildContext context){
    var provider = Provider.of<ChooseTypeProvider>(context,listen: false);
    if(provider.selectedType == ''){
      return provider.selectedType == AppLocalizations.of(context)!.translation ? translationOption : learningOption;
    }else{
      return provider.selectedType == AppLocalizations.of(context)!.translation ?
      translationOption : learningOption;
    }
  }

  List<Widget> translationOption =  <Widget>[
    const HomePage(),
    const FishPage(),
    const ProfilePage(),
  ];
  List<Widget> learningOption =  <Widget>[

    const FishPage(),
    const HomePage(),
    const ProfilePage(),
  ];
}
