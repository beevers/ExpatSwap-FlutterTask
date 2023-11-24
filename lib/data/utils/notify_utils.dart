import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifyUtil {
  static showAlert(String message, [bool error = false]) {
    return Flushbar(
      isDismissible: false,
      flushbarPosition: FlushbarPosition.BOTTOM,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      message: message,
      icon: Icon(
        Icons.error_outline,
        size: 28.0,
        color:
            error ? const Color.fromARGB(255, 255, 130, 121) : Colors.grey[400],
      ),
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 300),
      leftBarIndicatorColor:
          error ? const Color.fromARGB(255, 255, 130, 121) : Colors.grey[400],
    ).show(Get.context!);
  }
}
