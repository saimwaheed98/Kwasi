import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:kwasi/core/data/datasources/auth.dart';
import '../../../pages/create_profile/data/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  UserDetail _userDetail = const UserDetail();
  UserDetail get userDetail => const UserDetail();

  void getUserData(UserDetail data) {
    _userDetail = data;
    notifyListeners();
  }

  Future<void> getSelfInfo() async {
    var userData = await Auth.getSelfInfo();
    _userDetail = userData;
    getInterestedIn();
    log('User data: ${_userDetail.wantToLearn}');
    notifyListeners();
  }


  String _interestedIn = "";
  String get interestedIn => _interestedIn;

  // get the interested in value
  getInterestedIn() {
    _interestedIn = _userDetail.interestedIn;
    notifyListeners();
  }

  // update the value of the interested in
  void updateInterestedIn(String value) {
    _userDetail = _userDetail.copyWith(interestedIn: value);
    notifyListeners();
  }

  // update the value of learning words
  void updateLearningWords(String word) {
    _userDetail = _userDetail.copyWith(wantToLearn: word);
    notifyListeners();
  }




  //// update language by single string
 void updateLearningWord(String word) {
    _userDetail = _userDetail.copyWith(wantToLearn: word);
    notifyListeners();
  }
}
