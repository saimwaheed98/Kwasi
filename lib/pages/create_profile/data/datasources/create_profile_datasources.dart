import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kwasi/core/data/datasources/auth.dart';
import 'package:kwasi/dialouge/toast_message.dart';
import 'package:kwasi/pages/create_profile/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CreateProfileDatasources {
  Future<String> createProfile(UserDetail profile, BuildContext context);
}

class CreateProfileDatasourcesImpl implements CreateProfileDatasources {
  @override
  Future<String> createProfile(
      UserDetail profile, BuildContext context) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      // create profile
     return await Auth.firestore
          .collection('users')
          .doc(profile.uid)
          .set(profile.toJson())
          .onError((error, stackTrace) {
        log('Error creating profile: firestore onError => $error');
        throw Exception('Error creating profile');
      }).then((value) {
        prefs.setString("userId", profile.uid);
        log('Profile created successfully');
      return "success";
      });
    } catch (e) {
      // ignore: use_build_context_synchronously
      WarningHelper.showErrorToast('Error while creating profile', context);
      log('catching error: $e');
      return "error";
    }
  }
}
