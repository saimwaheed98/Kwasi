import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kwasi/core/data/datasources/auth.dart';

class ProfilePickProvider extends ChangeNotifier{
  File? _image;
  File? get image => _image;

  getImage(String path){
    _image = File(path);
    notifyListeners();
  }

  final imagePicker = ImagePicker();




  Future<void> pickImage(BuildContext context)async{
    try{
      XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
      if(image != null){
        getImage(image.path);
       await Auth.updateProfileImage(_image ?? File(""), context);
      }
    }catch(e){
      log(e.toString());
    }
  }
}