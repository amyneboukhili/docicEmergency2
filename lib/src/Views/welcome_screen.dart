

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
            SizedBox(child:Lottie.asset(
            "assets/animations/doctors.json",
            width: 200.w,
            height: 200.h,
            repeat: true,
          ),width: 250.w,),
           
            Text("Welcome To Docic Hero",style:Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize:30.sp,fontWeight: FontWeight.bold,color: ThemeUtils.secondaryGreenBlue ) ,),
            SizedBox(height: 30.h,),
             const Text("L'application DOCIC vous permet de stocker, consulter et partager très facilement vos documents de santé en toute sécurité, à tout moment et partout où vous vous trouvez.",  textAlign: TextAlign.center,
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