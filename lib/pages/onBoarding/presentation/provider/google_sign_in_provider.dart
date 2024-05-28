import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/core/data/provider/auth_provider.dart';
import 'package:kwasi/dialouge/toast_message.dart';
import 'package:kwasi/pages/create_profile/data/models/user_model.dart';
import 'package:kwasi/pages/onBoarding/data/datasources/create_profile_google_datasources.dart';
import 'package:kwasi/routes/routes_imports.gr.dart';
import 'package:provider/provider.dart';

class GoogleSignInProvider extends ChangeNotifier {
  bool _isCreatingProvfile = false;
  bool get isCreatingProfile => _isCreatingProvfile;

  isCreating(bool value) {
    _isCreatingProvfile = value;
    notifyListeners();
  }

  Future<UserDetail> googleSignIn(BuildContext context) async {
    final CreateProfileGoogleDataSources googleSignIn =
        CreateProfileGoogleDataSourcesImpl();
    var provider = Provider.of<AuthProvider>(context, listen: false);

    return googleSignIn.createProfileWithGoogle(context).then((value) {
      if (value.uid.isNotEmpty) {
        provider.getUserData(value);
        AutoRouter.of(context).pushAndPopUntil(
          const BottomNavBarRoute(),
          predicate: (route) => false,
        );
        return value;
      } else {
        WarningHelper.showErrorToast('Error while creating account', context);
        throw Exception('error while creating account');
      }
    });
  }
}
