import 'package:docicemergency2/src/Utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          "assets/animations/ambulance.json",
          width: 200.w,
          height: 200.h,
          repeat: true,
        ),
        InfoWidget(
          text: "Serie Number: 77-554654-5464654",
          color: ThemeUtils.secondaryGreenBlue,
        ),
        InfoWidget(
          text: "Drive Name: Amine",
          color: ThemeUtils.secondaryGreenBlue.withAlpha(200),
        ),
        InfoWidget(
          text: "Staff number: 2",
          color: ThemeUtils.secondaryGreenBlue.withAlpha(150),
        ),
      ],
    );
  }

  Widget InfoWidget({required String text, required Color color}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      width: Get.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
