import 'dart:math';
// import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/dialouge/toast_message.dart';
import 'package:kwasi/lang.dart';
import 'package:kwasi/pages/home/data/model/language_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../learn_lang/provider/learn_lang_provider.dart';

class LangugesProvider extends ChangeNotifier {

  TextEditingController writingFieldController = TextEditingController();

  List<LanguageModel> _langList = [];
  List<LanguageModel> get langList => _langList;

  getLanguges(List<LanguageModel> lang) {
    _langList = lang;
    notifyListeners();
  }

  // get the translated language
  LanguageModel _translatedText = const LanguageModel();
  LanguageModel get translatedText => _translatedText;

  getTranslate(LanguageModel text) {
    _translatedText = text;
    notifyListeners();
  }

  getLanguge(String lang) {
    // log('lang $lang');
    getTranslate(const LanguageModel());
    if(_translatedText.english.isEmpty){
      getTranslate(const LanguageModel());
    }
    for (var i in _langList) {
      if(selectedLanguages == "English"){
        if (i.english.toLowerCase() == lang.toLowerCase()) {
        getTranslate(i);
        // log('translated $i');
        notifyListeners();
      }
      } else if (selectedLanguages == "Duala"){
       if (i.duala.toLowerCase() == lang.toLowerCase()) {
        getTranslate(i);
        // log('translated $i');
        notifyListeners();
      }
      }else if(selectedLanguages == "Bulu"){
        if (i.bulu.toLowerCase() == lang.toLowerCase()) {
        getTranslate(i);
        // log('translated $i');
        notifyListeners();
        }
      }else if(selectedLanguages == "Ghomala"){
        if (i.ghomla.toLowerCase() == lang.toLowerCase()) {
        getTranslate(i);
        // log('translated $i');
        notifyListeners();
        }
      }else if(selectedLanguages == "French"){
        if (i.french.toLowerCase() == lang.toLowerCase()) {
        getTranslate(i);
        // log('translated $i');
        notifyListeners();
        }
      }
    }
  }

  // get languges from database
  List<LanguageModel> getLangugesFromDB()  {
   var list = translations.map((e) => LanguageModel.fromJson(e)).toList();
   // log("list lenght ${list.length}");
   getLanguges(list);
   return list;
  }

  // get the translated language
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlay = false;

// play audio
  playAudio(BuildContext context) async {
    try {
      // log("playing");
      isPlay = true;
      await _audioPlayer.setVolume(1);
      notifyListeners();
      if(selectedTranslatedLanguages == "Duala"){
        if(translatedText.dualaVoiceUrl.isNotEmpty){
          await _audioPlayer.play(
              UrlSource(translatedText.dualaVoiceUrl)
          );
        }else{
          WarningHelper.showWarningToast(AppLocalizations.of(context)!.currentlyUnAvailable, context);
        }
      isPlay = false;
      notifyListeners();
      _audioPlayer.onSeekComplete.listen((event) {
        isPlay = false;
        notifyListeners();
      });
      notifyListeners();
      }else if (selectedTranslatedLanguages == "Bulu"){
        if(translatedText.buluVoiceUrl.isEmpty){
          WarningHelper.showWarningToast(AppLocalizations.of(context)!.currentlyUnAvailable, context);
        }else{
          await _audioPlayer.play(
              UrlSource(translatedText.buluVoiceUrl)
          );
        }

        isPlay = false;
        notifyListeners();
        _audioPlayer.onSeekComplete.listen((event) {
          isPlay = false;
          notifyListeners();
        });
      notifyListeners();
      }else if(selectedTranslatedLanguages == "Ghomala"){
        if(translatedText.ghomalaVoiceUrls.isNotEmpty){
          await _audioPlayer.play(
              UrlSource(translatedText.ghomalaVoiceUrls)
          );
        }else{
          WarningHelper.showWarningToast(AppLocalizations.of(context)!.currentlyUnAvailable, context);
        }
        isPlay = false;
        notifyListeners();
        _audioPlayer.onSeekComplete.listen((event) {
          isPlay = false;
          notifyListeners();
        });
      notifyListeners();
      }
    } catch (e) {
      // log(e.toString());
      isPlay = false;
      notifyListeners();
    }
  }

  stopAudio() async {
    await _audioPlayer.stop();
  }


  //change the value of the selected language
  changeThePosition() {
      String temp = _selectedLanguages;
     _selectedLanguages = _selectedTranslatedLanguages;
      _selectedTranslatedLanguages = temp;
    notifyListeners();
  }


  // list of languages
  final List<String> translatedLanguages = [
    'Duala',
    'Bulu',
    'Ghomala',
  ];

    final List<String> selectedLang = [
     'English', 'French'
  ];

  // selected languages
  String _selectedLanguages = "";
  String get selectedLanguages => _selectedLanguages;

  // add language
  addLanguage(String language) {
    _selectedLanguages = language;
    notifyListeners();
  }

  // change the language value
  changeLanguage(){
    if(_selectedLanguages == "English"){
      writingFieldController.text = _translatedText.english;
    }else if(_selectedLanguages == "French"){
      writingFieldController.text = _translatedText.french;
    }
  }

  // selected translated language

  String _selectedTranslatedLanguages = "Duala";
  String get selectedTranslatedLanguages => _selectedTranslatedLanguages;

  // add language
  addTranslatedLanguage(String language,BuildContext context) {
    Provider.of<LearnLangProvider>(context,listen: false).addLang(language);
    _selectedTranslatedLanguages = language;
    notifyListeners();
  }


  // get quizIndex
  int _quizIndex=0;
  int get quizIndex=>_quizIndex;

  String _questionName='';
  String get questionName=>_questionName;

  String _quizAnswer="";
  String get quizAnswer => _quizAnswer;

  // generate the index
  generateIndex(){
    int index = Random().nextInt(_langList.length);
    _quizIndex = index;
    notifyListeners();
  }

  generateQuestion() {
    if (_selectedLanguages == 'English') {
      getLanguge(_langList[_quizIndex].english);
      _questionName = _langList[_quizIndex].english;
      getTranslate(_langList[_quizIndex]);
      notifyListeners();
    } else if (_selectedLanguages == 'Bulu') {
      getLanguge(_langList[_quizIndex].bulu);
      _questionName = _langList[_quizIndex].bulu;
      getTranslate(_langList[_quizIndex]);
      notifyListeners();
    } else if (_selectedLanguages == 'Duala') {
      getLanguge(_langList[_quizIndex].duala);
      _questionName = _langList[_quizIndex].duala;
      getTranslate(_langList[_quizIndex]);
      notifyListeners();
      notifyListeners();
    } else if (_selectedLanguages == 'Ghomala') {
      getLanguge(_langList[_quizIndex].ghomla);
      _questionName = _langList[_quizIndex].ghomla;
      getTranslate(_langList[_quizIndex]);
      notifyListeners();
    } else if (_selectedLanguages == 'French') {
      getLanguge(_langList[_quizIndex].french);
      _questionName = _langList[_quizIndex].french;
      getTranslate(_langList[_quizIndex]);
      notifyListeners();
    }
  }

  getTheQuizAnswer(String value) {
    _quizAnswer = value;
    notifyListeners();
  }

  getQuizName() {
    LanguageModel question = _langList[_quizIndex];
    if (_selectedTranslatedLanguages == "Duala") {
      getTheQuizAnswer(question.duala);
      notifyListeners();
    } else if (_selectedTranslatedLanguages == "Bulu") {
      getTheQuizAnswer(question.bulu);
      notifyListeners();
    } else if (_selectedTranslatedLanguages == "Ghomala") {
      getTheQuizAnswer(question.ghomla);
      notifyListeners();
    } else if (_selectedTranslatedLanguages == "English") {
      getTheQuizAnswer(question.english);
      notifyListeners();
    } else if (_selectedTranslatedLanguages == "French") {
      getTheQuizAnswer(question.french);
      notifyListeners();
    }
    notifyListeners();
  }
}
