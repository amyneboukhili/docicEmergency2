// ignore_for_file: camel_case_types

import 'package:docicemergency2/src/Controllers/login_controller.dart';

import 'package:get/get.dart';


class loginBuiding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}