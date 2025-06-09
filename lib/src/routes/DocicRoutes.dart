
// ignore_for_file: file_names;
import 'package:docicemergency2/src/Views/home_view.dart';
import 'package:docicemergency2/src/Views/login_view.dart';
import 'package:docicemergency2/src/Views/signup_view.dart';
import 'package:docicemergency2/src/Views/welcome_screen.dart';
import 'package:docicemergency2/src/bidings/Signup_biding.dart';
import 'package:docicemergency2/src/bidings/home_bidings.dart';
import 'package:docicemergency2/src/bidings/login_biding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final routes = [
    // GetPage(
    //   name: '/welcomeScreen',
    //   page: () =>const MyContactPage(),
    //   binding: ContactBuiding(),
    // ),
//     GetPage(
//   name: '/',
//   page: () => const SplashScreen(),
//   binding:SplashBiding()
// ),
     GetPage(
      name: '/welcomeScreen',
      page: () =>const welcomeScreen (),
    ),
      GetPage(
      name: '/login',
      page: () =>const LoginView(),
      binding: loginBuiding(),
    ),
      GetPage(
      name: '/signup',
      page: () =>const SignupView(),
      binding: SignUpBuiding(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeView(),
      binding: HomeBidings(),
    ),
  ];
}