
import 'package:docicemergency2/src/Controllers/signUp_controller.dart';
import 'package:get/get.dart';


class SignUpBuiding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignupController());
  }
}