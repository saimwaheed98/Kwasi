import 'package:flutter/material.dart';
import 'package:kwasi/core/data/datasources/auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/data/provider/auth_provider.dart';

class LearnLangProvider extends ChangeNotifier {
  List<String> languages = [
    'Duala',
    'Bulu',
    'Bassa',
    'Ghomala',
  ];



  String _selectedLanguage="";
  String get selectedLanguage=>_selectedLanguage;
  
  addLang(String lang){
    _selectedLanguage=lang;
    notifyListeners();
  }

// store the selected languages
   storeSelectedLanguage(BuildContext context) async {
    var authProvider = Provider.of<AuthProvider>(context,listen: false);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId') ?? Auth.user!.uid;
    authProvider.updateLearningWord(_selectedLanguage);
    await Auth.firestore.collection("users").doc(userId).update({
      "wantToLearn" : _selectedLanguage
    });
  }

}
