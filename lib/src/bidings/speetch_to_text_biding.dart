import 'package:docicemergency2/src/Controllers/speech_to_text_controller.dart';
import 'package:get/get.dart';


class SpeetchToTextBiding extends Bindings {
  @override
  void dependencies() {
     Get.put<SpeechToTextController>(SpeechToTextController());
  }
}