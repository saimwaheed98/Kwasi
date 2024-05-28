import 'package:flutter/material.dart';
import 'package:kwasi/core/data/provider/auth_provider.dart';
import 'package:kwasi/dialouge/toast_message.dart';
import 'package:kwasi/pages/create_profile/data/datasources/create_profile_datasources.dart';
import 'package:kwasi/pages/create_profile/data/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CreateProfileProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }




  String _isSelected = '';
  String get isSelected => _isSelected;

  changeValue(String value) {
    _isSelected = value;
    notifyListeners();
  }

  // check if the profile is createing
  bool _isCreatingProfile = false;
  bool get isCreatingProfile => _isCreatingProfile;

  isCreating(bool value) {
    _isCreatingProfile = value;
    notifyListeners();
  }

  // create user profile
  Future<UserDetail> createProfile({
    required String userName,
    required String userAge,
    required String userGender,
    String? email,
    String? uid,
    required BuildContext context,
  }) async {
    final CreateProfileDatasources createProfileDatasources =
        CreateProfileDatasourcesImpl();
    // ignore: use_build_context_synchronously
    var provider = Provider.of<AuthProvider>(context, listen: false);
    isCreating(true);
    var id = const Uuid().v4();
    var profile = UserDetail(
      createdAt: DateTime.now().toString(),
      email: email ?? '',
      pushToken: '',
      uid: uid ?? id,
      userAge: userAge,
      userGender: userGender,
      username: userName,
      interestedIn: "",
      photoURL: "",
      wantToLearn: "",
    );
    // ignore: use_build_context_synchronously
    return await createProfileDatasources
        .createProfile(profile, context)
        .then((value) async {
      if (value == "success") {
        isCreating(false);
        provider.getUserData(profile);
        return profile;
      } else {
        WarningHelper.showErrorToast(
            'Error while creating account please check your internet connection and try again later',
            context);
        isCreating(false);
        throw Exception('creating profile unsuccessfull');
      }
    });
  }
}
