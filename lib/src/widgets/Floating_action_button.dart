import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final VoidCallback onPressed;

  const CustomFloatingActionButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      margin: EdgeInsets.symmetric(horizontal: 80.w),
      child: TextButton.icon(
        onPressed: onPressed,
        label: Text(text),
        icon: icon,
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white, // Optional: to make text/icon white
        ),
      ),
    );
  }
}
