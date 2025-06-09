import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showConfirmDialog({
  required BuildContext context,
  required VoidCallback onConfirm,
  required String asset,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      backgroundColor: Colors.white,
      title: Column(
        children: [
          Lottie.asset(
            asset,
            width: 100.w,
            height: 100.h,
            repeat: false,
          ),
          Text(
            "Are you sure?",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
      content: Text(
        "Do you really want to delete this contact?",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.sp),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        SizedBox(
          height: 50,
          width: 80,
          child: TextButton(
            onPressed: () => Navigator.pop(context), 
            child: Text(
              "No",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
        ElevatedButton(
          
          onPressed: () {
            Navigator.pop(context); 
            onConfirm();            
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size(80, 50),
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(
            "Yes",
            style: TextStyle(fontSize: 16.sp, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
