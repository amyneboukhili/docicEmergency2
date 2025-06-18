import 'package:docicemergency2/src/Data/GlobalData.dart';
import 'package:docicemergency2/src/Models/emergency_description.dart';
import 'package:docicemergency2/src/Services/speech_to_text_service.dart';
import 'package:docicemergency2/src/widgets/mySnackBar.dart';
import 'package:get/get.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextController extends GetxController {
  final SpeechToText _speech = SpeechToText();
  var isListening = false.obs;
  var recognizedText = ''.obs;
  final _service= SpeechToTextService();

  Future<void> toggleRecording() async {
  var status = await Permission.microphone.request();

  if (!status.isGranted) {
    Get.snackbar("Permission Denied", "Microphone permission is required.");
    return;
  }

  if (!_speech.isAvailable) {
    bool available = await _speech.initialize();
    if (!available) {
      Get.snackbar("Error", "Speech recognition not available.");
      return;
    }
  }

  if (_speech.isListening) {
    _speech.stop();
    isListening.value = false;
  } else {
    _speech.listen(
      onResult: (result) async {
        recognizedText.value = result.recognizedWords;
        if (result.finalResult) {
          isListening.value = false;
          await _speech.stop();
          await addDescription();
        }
      },
      listenFor: const Duration(seconds: 10),
      pauseFor: const Duration(seconds: 3),
    );
    isListening.value = true;
  }

  update();
}



  Future <void> addDescription()async{
     await GlobalData.init();
      final Map<String, dynamic>? profile = GlobalData.myprofile;
      if (profile==null) {
        throw Exception("u dont have a profile id ");
      }
   final desc =  EmergencyDescription(emergencyId: 31, ambulanceId: profile["id"], description: recognizedText.value, situationType: "current S");
   final  result= await _service.addEmergencyDescription(desc) ; 
   if (result) {
    mySnackBar.show(title: "sucess", message: "ur description for the current situation is added with secsess",isSuccess: true);
     
   } else {
     mySnackBar.show(title: "failed", message: "failed to add ",isSuccess: false);
   }
  }

  @override
  void onClose() {
    _speech.stop();
    print("//////////////////////////////////////////////////////////");
    print(recognizedText.value);
  
    super.onClose();
  }
  
}