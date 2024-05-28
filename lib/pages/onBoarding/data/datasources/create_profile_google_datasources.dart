import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/dialouge/toast_message.dart';
import 'package:kwasi/pages/create_profile/data/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kwasi/pages/create_profile/presentation/provider/create_profile_provider.dart';
import 'package:provider/provider.dart';

abstract class CreateProfileGoogleDataSources {
  Future<UserDetail> createProfileWithGoogle(BuildContext context);
}

class CreateProfileGoogleDataSourcesImpl
    extends CreateProfileGoogleDataSources {
  @override
  Future<UserDetail> createProfileWithGoogle(context) async {
    var provider = Provider.of<CreateProfileProvider>(context, listen: false);
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      var credentials =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // ignore: use_build_context_synchronously
      return provider.createProfile(
          userName: credentials.user!.displayName!,
          userAge: '',
          uid: credentials.user!.uid,
          context: context,
          email: credentials.user!.email,
          userGender: '');
    } catch (e) {
      // ignore: use_build_context_synchronously
      WarningHelper.showErrorToast('Error while creating account', context);
      log('error on creating account with google');
      throw Exception('error on creating accpunt with google');
    }
  }
}
