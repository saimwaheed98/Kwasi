import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kwasi/core/data/datasources/auth.dart';
import 'package:kwasi/core/data/provider/auth_provider.dart';
import 'package:kwasi/pages/learn_lang/provider/learn_lang_provider.dart';
import 'package:kwasi/pages/learning_words/model/learning_words_model.dart';
import 'package:kwasi/pages/navBar/provider/bottom_bar_provider.dart';
import 'package:kwasi/words.dart';
import 'package:provider/provider.dart';

class LearningWordProvider extends ChangeNotifier {
  String _isSelected = '';
  String get isSelected => _isSelected;

  bool _firstTimeSelect=false;
  bool get firstTimeSelect=>_firstTimeSelect;

  changFirstSelection(bool value){
    _firstTimeSelect = value;
    notifyListeners();
  }

  void selectWord(String value) {
    _isSelected = value;
    notifyListeners();
  }


  // get the question value the quiz are set of 10
  double _quizValue = 0.0;
  double get quizValue => _quizValue;

  double get remainingValue => (0.0 + _quizValue).clamp(0.0, 1.0) * 10;

  restartQuizValue(){
    _quizValue=0.0;
    _firstTimeSelect=false;
    notifyListeners();
  }

  void changeQuizValue() {
    if (_quizValue < 0.9) {
      _quizValue = _quizValue + 0.1;
      if (_quizValue > 0.9) {
        _quizValue = 1.0;
      }
    } else {
      _quizValue = 0.0;
    }
    notifyListeners();
  }


  // 1. get the words

  List<LearningWordsModel> _learningWordsModel = [];
  List<LearningWordsModel> get learningWordsModel => _learningWordsModel;

  getWords() {
    for (var i in words) {
      LearningWordsModel data = LearningWordsModel.fromJson(i);
      _learningWordsModel.add(data);
      notifyListeners();
    }
  }

  // 2. generate the random index to generate the question
  int _questionIndex = 0;
  int get questionIndex => _questionIndex;

  generateQuestionIndex() {
    int index = Random().nextInt(_learningWordsModel.length);
    _questionIndex = index;
    notifyListeners();
  }

  // generate the question according to the random question index
  String _questionName = "";
  String get questionName => _questionName;

  int quizIndex = 0;

  // change the question name
  changeQuestionName(String value){
    _questionName = value;
    notifyListeners();
  }

  getQuestionName(BuildContext context) {
    LearningWordsModel question = _learningWordsModel[_questionIndex];
    List<int> possibleIndices = [0, 1, 2, 3, 4, 5];
    var learn = Provider.of<LearnLangProvider>(context,listen: false).selectedLanguage;

    // Remove the index corresponding to the learned language
    if (learn == "Duala") {
      possibleIndices.remove(2);
    } else if (learn == "Bulu") {
      possibleIndices.remove(4);
    } else if (learn == "Bassa") {
      possibleIndices.remove(5);
    } else if (learn == "Ghomala") {
      possibleIndices.remove(3);
    }

    // Randomly select an index from the remaining ones
    int index = possibleIndices[Random().nextInt(possibleIndices.length)];
    quizIndex = index;
    debugPrint("index $index");
    getQuizName(context);
    notifyListeners();

    // Assign the question name based on the selected index
    if (index == 0) {
      _questionName = question.english;
    } else if (index == 1) {
      _questionName = question.french;
    } else if (index == 2) {
      _questionName = question.duala;
    } else if (index == 3) {
      _questionName = question.ghomala;
    } else if (index == 4) {
      _questionName = question.bulu;
    } else if (index == 5) {
      _questionName = question.basaa;
    }

    notifyListeners();
    debugPrint("How do we say $_questionName in $_quizName");
  }


  // 3. generate the question value like what should be the answer of the question
  String _quizName = "";
  String get quizName => _quizName;

  getQuizName(BuildContext context) {
    LearningWordsModel question = _learningWordsModel[_questionIndex];
    var learn=Provider.of<LearnLangProvider>(context,listen: false).selectedLanguage;
    if (learn == "Duala") {
      _quizName = learn;
      getTheQuizAnswer(question.duala);
      getTheQuizOptions();
      notifyListeners();
    } else if (learn == "Bulu") {
      _quizName = learn;
      getTheQuizAnswer(question.bulu);
      getTheQuizOptions();
      notifyListeners();
    } else if (learn == "Bassa") {
      _quizName = learn;
      getTheQuizAnswer(question.basaa);
      getTheQuizOptions();
      notifyListeners();
    } else if (learn == "Ghomala") {
      _quizName = "Ghomala";
      getTheQuizAnswer(question.ghomala);
      getTheQuizOptions();
      notifyListeners();
    }
  }

  // 4. generate the quiz answer

  String _quizAnswer = "";
  String get quizAnswer => _quizAnswer;

  getTheQuizAnswer(String value) {
    _quizAnswer = value;
    debugPrint("answer of the question $_quizAnswer");
    notifyListeners();
  }

  // 5. generate the quiz options
  List<String> _quizOptions = [];
  List<String> get quizOptions => _quizOptions;

  void getTheQuizOptions() {
    _quizOptions.clear();
    for (var i = 0 ; i < 3 ; i++) {
      int index = Random().nextInt(_learningWordsModel.length);
      if (_quizName == "English") {
        _quizOptions.add(_learningWordsModel[index].english);
        
        notifyListeners();
      } else if (_quizName == "Duala") {
        _quizOptions.add(_learningWordsModel[index].duala);
        
        notifyListeners();
      } else if (_quizName == "Ghomala") {
        _quizOptions.add(_learningWordsModel[index].ghomala);
        
        notifyListeners();
      } else if (_quizName == "Bulu") {
        _quizOptions.add(_learningWordsModel[index].bulu);
       
        notifyListeners();
      } else if (_quizName == "French") {
        _quizOptions.add(_learningWordsModel[index].french);
        
        notifyListeners();
      } else {
        _quizOptions.add(_learningWordsModel[index].basaa);
      
        notifyListeners();
      }
    }
    // Generate a random index to insert the quizAnswer
    var randomIndex = Random().nextInt(_quizOptions.length + 1);
    _quizOptions.insert(randomIndex, quizAnswer);
    debugPrint("data of the options $_quizOptions");
    notifyListeners();
  }

  // last step check tha answer
  bool isAnswerCorrected = false;

  bool isChangeUi = false;

  checkAnswer(BuildContext context){
    if(_isSelected == _quizAnswer){
      debugPrint("true");
      isAnswerCorrected = true;
      isChangeUi = true;
      changeQuizValue();
      changFirstSelection(false);
      notifyListeners();
    }else{
      isChangeUi = true;
      isAnswerCorrected = false;
      notifyListeners();
    }
  }

}
