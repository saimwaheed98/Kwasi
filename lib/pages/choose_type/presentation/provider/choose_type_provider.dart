import 'package:flutter/material.dart';
import 'package:kwasi/core/data/datasources/auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/data/provider/auth_provider.dart';

class ChooseTypeProvider extends ChangeNotifier {
  String _selectedType = '';
  String get selectedType => _selectedType;

  void selectType(String type) {
    _selectedType = type;
    notifyListeners();
  }

  // save the interest type in db
  saveType(BuildContext context) async{
    var authProvider = Provider.of<AuthProvider>(context,listen: false);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId') ?? Auth.user?.uid ?? "";
    authProvider.updateInterestedIn(_selectedType);
    await Auth.firestore.collection("users").doc(userId).update({
      "interestedIn" : _selectedType
    });
  }
}
