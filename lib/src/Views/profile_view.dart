import 'package:docicemergency2/src/Utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeUtils.secondaryGreenBlue,
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                const Text(
                  "Profile page",
                  style: TextStyle(
                    color: ThemeUtils.white,
                    fontFamily: 'Jost',
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 24.h),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Lottie.asset(
                    "assets/animations/ambulance.json",
                    width: 200.w,
                    height: 200.h,
                    repeat: true,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Serie Number: 77-554654-5464654",
                  style: TextStyle(
                    color: ThemeUtils.white,
                    fontFamily: 'Jost',
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.sp),
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withAlpha(150),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Icon(Icons.edit),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.sp),
                          child: GestureDetector(
                            // onTap: () => controller.getData(),
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withAlpha(150),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Icon(Icons.menu_outlined),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),
                    InfoWidget(
                      text: "Drive Name: Amine",
                      color: ThemeUtils.secondaryGreenBlue.withAlpha(150),
                    ),
                    InfoWidget(
                      text: "Staff number: 2",
                      color: ThemeUtils.secondaryGreenBlue.withAlpha(150),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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

/*import 'package:docicemergency2/src/Utils/theme_utils.dart';
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
}*/
