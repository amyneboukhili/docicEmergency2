
import 'package:docicemergency2/src/Controllers/login_controller.dart';
import 'package:docicemergency2/src/Utils/theme_utils.dart';
import 'package:docicemergency2/src/widgets/TextFieldWidget.dart';
import 'package:docicemergency2/src/widgets/buttonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) =>
     Scaffold(
    
      body: Container(
      height: double.infinity,
        width: double.infinity,
        decoration:const BoxDecoration(
          color: ThemeUtils.secondaryGreenBlue,
          gradient: LinearGradient(colors: [Color(0xFF66D2CE),Color(0xFFFFFFFF)],begin: Alignment.topRight,end:  Alignment.bottomLeft),
          
        ),
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding:  EdgeInsets.only(bottom: 10),
                    child: Text(
                      "login Now",
                      style: TextStyle(fontSize: 38, color: Colors.black),
                    ),
                  ),
                  Image.asset('assets/images/Medicineamico.png', height: 200.h),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFieldWidget(
                    hint: "7845215-457",
                    inputType: TextInputType.numberWithOptions(),
                    controller: controller.serieNumbercontroller,
                    label: "put ur serial number",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                 Obx(() => TextFieldWidget(
  hint: "Password",
  controller: controller.passwordcontroller,
  label: 'Password',
  hidden: controller.ispassword.value,
  suffixIcon: controller.ispassword.value
      ? Icons.visibility
      : Icons.visibility_off,
  onTap: () {
    controller.ispassword.value = !controller.ispassword.value;
  },
)),
                  SizedBox(
                    height: 25.h,
                  ),
                  BottomNavigationButton(
                    onPressed: (){
                      controller.login();
                    } ,
                    text: "logIn",
                    color: const [Color(0xFF33E4DB), Color(0xFF00BBD3)],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Vous n'avez pas de compte encore?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      GestureDetector(
                          onTap: () => Get.offNamed('signup'),
                          child: Text(
                            "S'Inscrire",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: ThemeUtils.primaryBlue,
                                decoration: TextDecoration.underline),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
}}
  