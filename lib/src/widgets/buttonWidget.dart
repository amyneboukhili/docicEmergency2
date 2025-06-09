// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double? width;
  final double? height;
  final List <Color>? color;

  const BottomNavigationButton({
    super.key, 
    required this.onPressed, 
    required this.text, 
    this.width, 
    this.height,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h, left: 16.w, right: 16.w),
      height: height ?? 54.h, 
      width: width ?? 327.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:color?? [Color(0xFF007AFF), Color(0xFF0056D2)], 
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
