import 'package:docicemergency2/src/Controllers/signUp_controller.dart';
import 'package:docicemergency2/src/Utils/theme_utils.dart';
import 'package:docicemergency2/src/widgets/TextFieldWidget.dart';
import 'package:docicemergency2/src/widgets/buttonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    Get.find<SignupController>();
    return GetBuilder<SignupController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFFFFF), Color(0xFF66D2CE)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: [
                       SizedBox(height: 40.h), 
                      const Text(
                        "Talk As About You !",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       SizedBox(height: 4.h),
                      const Text(
                        "please carefully complete your personal information",
                        style: TextStyle(fontSize: 14),
                      ),
                       SizedBox(height: 20.h),
                      const Text(
                        "Account Information",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       SizedBox(height: 10.h),
                      TextFieldWidget(
                        hint: "7845215-457",
                        prefixicon: Icons.numbers_rounded,
                        inputType: const TextInputType.numberWithOptions(),
                        controller: controller.serialController,
                        label: " serial number",
                      ),
                       SizedBox(height: 10.h),
                      Obx(
                        () => TextFieldWidget(
                          hint: "Adh@125",
                          prefixicon: Icons.password,
                          hidden: controller.ispassword.value,
                          suffixIcon: controller.ispassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          onTap: () {
                            controller.ispassword.value =
                                !controller.ispassword.value;
                          },
                          controller: controller.passwordController,
                          label: " password",
                        ),
                      ),
                       SizedBox(height: 10.h),
                      Obx(
                        () => TextFieldWidget(
                          hint: "Adh@125",
                          prefixicon: Icons.password,
                          hidden: controller.ispassword.value,
                          suffixIcon: controller.ispassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          onTap: () {
                            controller.ispassword.value =
                                !controller.ispassword.value;
                          },
                          controller: controller.passwordController,
                          label: " confirm password",
                        ),
                      ),
                       SizedBox(height: 20.h),
                      const Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text("And"),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                       SizedBox(height: 20.h),
                      const Text(
                        "Professional Information",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       SizedBox(height: 10.h),
                      TextFieldWidget(
                        hint: "DRIVER NAME",
                        prefixicon: Icons.person,
                        controller: controller.driverNameController,
                        label: "driver name",
                      ),
                       SizedBox(height: 10.h),
                      Container(
                        width: 327.w,
                        decoration: BoxDecoration(
                          color: ThemeUtils.containerColor,
                          borderRadius: BorderRadius.circular(15.r),
                          border: BoxBorder.all(
                            color: ThemeUtils.secondaryGreenBlue,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 2,
                                child: Text(
                                  "Staff Number",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ThemeUtils.hintColor,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        controller.minusStuf();
                                      },
                                    ),
                                    Obx(
                                      () => Text(
                                        '${controller.staffNumber.value}',
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {
                                        controller.addstaf();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                       SizedBox(height: 30.h),
                      BottomNavigationButton(
                        onPressed: () => controller.signup(),
                        text: "Register",
                        color: const [
                          Color.fromARGB(255, 0, 0, 0),
                          Color.fromARGB(255, 0, 0, 0),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 30.sp,
                  left: 10.sp,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
