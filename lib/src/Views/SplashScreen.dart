
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
      body:Container(
        height: double.infinity,
        width: double.infinity,
        decoration:const BoxDecoration(
          color: ThemeUtils.secondaryGreenBlue,
          gradient: LinearGradient(colors: [Color(0xFF33E4DB),Color(0xFF00BBD3)],begin: Alignment.topRight,end:  Alignment.bottomLeft),
          
        ),
        child: Stack(
          children: [
                      Column(
             mainAxisAlignment: MainAxisAlignment.center ,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Center( child: Image.asset('assets/images/logoV2.png',width: 150.w,) ),
                            
                      SizedBox(
                        height: 30.h,
                      ),
             
              Text("Docic", style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize:48.sp,fontWeight: FontWeight.bold,color: Colors.white ),
                      ),
                      SizedBox(height: 80.h,),
                            Center( child:CircularProgressIndicator(
                              color: Colors.white,
                              
                            ),),
            ],
          ),
          ],
        ),
      ),
    );
  }

  Future timescreen ()
  async {
    // final prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString("token");
    Future.delayed( const Duration(milliseconds: 3000 )).then((value) => Navigator.push(context,MaterialPageRoute(builder:(context)=>  const welcomeScreen())));
  }
}