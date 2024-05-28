import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kwasi/pages/create_profile/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../../dialouge/toast_message.dart';

class Auth {
  // firebase auth variables
  static FirebaseAuth auth = FirebaseAuth.instance;
// firebase firestore variable
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
// firebase storage variable
  static FirebaseStorage storage = FirebaseStorage.instance;
  // for accessing the current user
  static User? get user => auth.currentUser;

  // for signing in the user
  static UserDetail userData = const UserDetail(
      createdAt: "",
      email: "",
      pushToken: "",
      uid: "",
      userAge: "",
      userGender: "",
      interestedIn: "",
      wantToLearn: "",
      username: "",
      photoURL: "");

  // getting the self info
  static Future<UserDetail> getSelfInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var userId = sp.getString('userId');
    return await firestore
        .collection('users')
        .doc(userId ?? user?.uid)
        .get()
        .then((value) {
      userData = UserDetail.fromJson(value.data()!);
      return userData;
    });
  }

  // update the user profile image
static Future<void> updateProfileImage(File image,BuildContext context)async{
  SharedPreferences sp = await SharedPreferences.getInstance();
  String userId = sp.getString('userId') ?? user?.uid ?? "";
  uploadImage(image, userId, context).then((value) async {
    if(value.isNotEmpty){
      await firestore.collection("users").doc(userId).update({
        "photoURL" : value
      });
    }
  });

}

  // upload image to firebase
 static Future<String> uploadImage(File file,String userid, BuildContext context) async {
    try {
      var id = const Uuid().v4();
      //getting image file extension
      final ext = file.path.split('.').last;

      //storage file ref with path
      final ref = Auth.storage
          .ref()
          .child('images/data/${userid}/$id.$ext');

      //uploading image
      await ref
          .putFile(file, SettableMetadata(contentType: 'image/$ext'))
          .then((loadingValue) {
        log('Data Transferred: ${loadingValue.bytesTransferred / 1000} kb');
      });
      //updating image in firestore database
      final imageUrl = await ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      // ignore: use_build_context_synchronously
      WarningHelper.showWarningToast(
             'Error while uploading image',context,);
      return '';
    }
  }
}
