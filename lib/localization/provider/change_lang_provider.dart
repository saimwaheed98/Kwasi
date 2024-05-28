import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLangProvider extends ChangeNotifier{

  Locale _locale = const Locale('en');
  Locale get locale => _locale;

  getLocalCode(Locale code){
    _locale = code;
    notifyListeners();
  }

  void changeLanguage(Locale locale) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (locale == const Locale('en')) {
      await sp.setString('lang_code', 'en');
    } else {
      await sp.setString('lang_code', 'fr');
    }
    getLocalCode(locale);
  }

  Future<void> getLanguage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? langCode = sp.getString('lang_code');
    log('lang $langCode ${locale.languageCode}');
    changeLanguage(Locale(langCode ?? 'en'));
  }
}