import 'package:flutter/material.dart';
import 'package:get/get.dart';

class mySnackBar {
  static void show({
    required String title,
    required String message,
    bool isSuccess = true,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        icon: Icon(
          isSuccess ? Icons.check_circle : Icons.error,
          color: Colors.white,
        ),
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(10),
        borderRadius: 10,
      ),
    );
  }
}
