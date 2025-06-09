import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future showEmergencyDialog() {
  return Get.defaultDialog(
    radius: 10,
    title: '',
    contentPadding: const EdgeInsets.all(16),
    backgroundColor: Colors.white,
    content: Column(
      children: [
        Lottie.asset(
          "assets/animations/alert.json",
          width: 80.w,
          height: 80.h,
          repeat: true,
        ),
        const SizedBox(height: 12),
        const Text(
          "Confirm your emergency.",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        /*const SizedBox(height: 8),
        Text(
          "Your request will be sent in ({controller1.countDown}) seconds.",
          textAlign: TextAlign.center,
        ),*/
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            Get.back(result: [true]);
          },
          child: const Text("Confirm", style: TextStyle(color: Colors.white)),
        ),
        SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            Get.back();
          },
          child: const Text("Cancel", style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}
