
import 'package:docicemergency2/src/Utils/theme_utils.dart';
import 'package:docicemergency2/src/Views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


@override
void initState() {
    // TODO: implement initState
    super.initState();
    timescreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        Image.asset("assets/images/doctor.png",fit: BoxFit.fill,),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: ThemeUtils.secondaryGreenBlue.withOpacity(0.26),

        ),
       Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 150.h,),
           Image.asset("assets/images/logodocic.png", height: 170.h,width: 170.w,),
           Text("Docic Emergency" , textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize:30.sp,fontWeight: FontWeight.bold,color: Colors.black )),
           Text("Medical app" , textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize:22.sp,fontWeight: FontWeight.bold,color: Colors.blueGrey )),


        ],
       ))
        ],
      ),
    ) ;
  }

  Future timescreen ()
  async {
    // final prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString("token");
    Future.delayed( const Duration(milliseconds: 3000 )).then((value) => Navigator.push(context,MaterialPageRoute(builder:(context)=>  const welcomeScreen())));
  }
}