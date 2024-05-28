import 'package:flutter/material.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toasty_box.dart';

class WarningHelper {
  static showWarningToast(String message, context) {
    return ToastService.showWarningToast(context,
        isClosable: true,
        length: ToastLength.short,
        shadowColor: const Color.fromARGB(255, 201, 171, 126).withOpacity(0.2),
        backgroundColor: Colors.orange.shade300,
        positionCurve: Curves.easeInOut,
        slideCurve: Curves.easeOut,
        message: message);
  }

  static showErrorToast(String message, context) {
    return ToastService.showErrorToast(context,
        isClosable: true,
        length: ToastLength.short,
        shadowColor: Colors.red.withOpacity(0.2),
        backgroundColor: Colors.red.shade400,
        positionCurve: Curves.easeInOut,
        slideCurve: Curves.easeOut,
        message: message);
  }

  static showSuccesToast(String message, context) {
    return ToastService.showSuccessToast(context,
        isClosable: true,
        length: ToastLength.short,
        shadowColor: Colors.green.withOpacity(0.2),
        backgroundColor: Colors.green.shade300,
        positionCurve: Curves.easeInOut,
        slideCurve: Curves.easeOut,
        message: message);
  }
}
