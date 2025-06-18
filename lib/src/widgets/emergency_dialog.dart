import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future<void> showEmergencyDialog({VoidCallback? onConfirm}) {
  return Get.defaultDialog(
    radius: 10,
    title: '',
    contentPadding: const EdgeInsets.all(16),
    backgroundColor: Colors.white,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          "assets/animations/alert.json",
          width: 80.w,
          height: 80.h,
          repeat: true,
        ),
        const SizedBox(height: 12),
        const Text(
          "We have an emergency to handle",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          textAlign: TextAlign.center,
        ),
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
            Get.back(result: true);
            if (onConfirm != null) onConfirm();
          },
          child: const Text("Confirm", style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 8),
        // Optionally, you can uncomment this if you want a cancel button:
        // ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: Colors.red,
        //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //   ),
        //   onPressed: () {
        //     Get.back(result: false);
        //   },
        //   child: const Text("Cancel", style: TextStyle(color: Colors.white)),
        // ),
      ],
    ),
  );
}
