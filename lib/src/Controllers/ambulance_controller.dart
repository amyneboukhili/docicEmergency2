import 'package:docicemergency2/src/Models/ambulance_model.dart';
import 'package:docicemergency2/src/Services/ambulance_service.dart';
import 'package:get/get.dart';

class AmbulanceController extends GetxController {
 
  final AmbulanceService _ambulanceService=AmbulanceService();
   AmbulanceModel? ambulance;
void getAmbulance() async{
    ambulance=await _ambulanceService.getAmbulance();
    update();
  }
@override
  void onInit() {
    super.onInit();
     getAmbulance();
  }

}