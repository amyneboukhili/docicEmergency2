

import 'package:docicemergency2/src/Utils/theme_utils.dart';
import 'package:docicemergency2/src/Views/SplashScreen.dart';

import 'package:docicemergency2/src/routes/DocicRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder:
        (context , child) {
          return GetMaterialApp(
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeUtils.light,

            home:const SplashScreen() ,
           //const  HomeView(),
          );
        }
      );
  }
}

