

import 'package:docicemergency2/src/Utils/theme_utils.dart';
import 'package:docicemergency2/src/widgets/buttonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100.h, ),
            Image.asset("assets/images/logoekhir.png"),
           
            // Text("Welcome To Docic Hero",style:Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize:30.sp,fontWeight: FontWeight.bold,color: ThemeUtils.secondaryGreenBlue ) ,),
            SizedBox(height: 30.h,),
             const Text("The DOCIC  app allows you to easily store, access and share your health documents securely, anytime and anywhere Stay safe  help is just one tap away.",  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12, color: Colors.grey),),

            SizedBox(height: 60.h,),
            BottomNavigationButton(onPressed:() => Get.toNamed('login'), text: "logIn",
            color:const [Color(0xFF33E4DB),Color(0xFF00BBD3)],
            ),
        
             BottomNavigationButton(onPressed:() => Get.toNamed('signup'), text: "signUp",
            color:const [Color(0xFF33E4DB),Color(0xFF00BBD3)],
            ),
        
          ],
        ),
      ),
    );
  }
}