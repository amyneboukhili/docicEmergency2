import 'package:docicemergency2/src/Models/Emergency_model.dart';
import 'package:docicemergency2/src/Models/allergies_model.dart';
import 'package:docicemergency2/src/Models/fiche_entecedent_model.dart';
import 'package:docicemergency2/src/Services/emergency_service.dart';
import 'package:docicemergency2/src/widgets/mySnackBar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ReportsController extends GetxController {
  final EmergencyService _service = EmergencyService();
    final emergencyService = EmergencyService();
    EmergencyModel ?emergency;
  FicheEntecedent? fiche;
 List< AllergieModel>? allergies;
  List<FlSpot> heartRateSpots = [
      FlSpot(0, 68),
      FlSpot(1, 70),
      FlSpot(2, 69),
      FlSpot(3, 72), 
      FlSpot(4, 71),
      FlSpot(5, 73),
      FlSpot(6, 72),
    ];
  LatLng? location;

@override
  void onInit() {
    getEmergency();
    super.onInit();
  }




 Future<void> getEmergency() async{
  try {
    final data = await _service.getEmegency();
       emergency=EmergencyModel.fromJson(data['emergency']);
       fiche=FicheEntecedent.fromJson(data['fiche']);
       allergies= (data['allergies'] as List).map((e) => AllergieModel.fromJson(e)).toList();
       
       print(emergency?.toJson());
        if (emergency?.late != null && emergency?.long != null) {
        location = LatLng(
        double.parse('${emergency?.late}'),
        double.parse('${emergency?.long}'),
      );
    }
      print("$data");
    if (emergency != null) {
      mySnackBar.show(title: "secsess", message: "your emrency have been add it ",isSuccess: true);
    }
    else{
      mySnackBar.show(title: "secsess", message: "your emrency have been add it ",isSuccess: true);
    }
  } catch (e) {
    print('$e');
    mySnackBar.show(message: "$e", title: 'ERROR', isSuccess: false);
  }
  update();
}

Future <void> makeitdone() async{
 try {
    final   result=  await emergencyService.makeitDone(emergency!.id!);
  if (result) {
     mySnackBar.show(title: "secsess", message: "your emrency have been add it ",isSuccess: true);
     emergency=null;
     update();
     
  } else {
     mySnackBar.show(title: "secsess", message: "your emrency have been  solved ",isSuccess: true);
  }
 } catch (e) {
    print('$e');
    mySnackBar.show(message: "$e", title: 'ERROR', isSuccess: false);
 }
 update();
}
   

}