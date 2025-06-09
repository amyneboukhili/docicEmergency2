import 'package:docicemergency2/src/Services/auth_service.dart';
import 'package:docicemergency2/src/widgets/mySnackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthService auth=AuthService();
 RxBool  ispassword = false.obs;
 final TextEditingController serieNumbercontroller=TextEditingController();
  final TextEditingController passwordcontroller=TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async{
   Map<String, dynamic>  result = await auth.login(serieNumbercontroller.text, passwordcontroller.text);
   if (result['access']!= null) {
    mySnackBar.show(
              message: "sucsess login, welcom hero ",
              title: 'sucsess',
              isSuccess: true);
              Get.toNamed('home');

  }
  else{
    mySnackBar.show(
              message: "ERROR TO  login invalid user",
              title: 'ERROR',
              isSuccess: false);
  }
  }
}