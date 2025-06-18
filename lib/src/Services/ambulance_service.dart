import 'dart:convert';

import 'package:docicemergency2/src/Data/GlobalData.dart';
import 'package:docicemergency2/src/Models/ambulance_model.dart';
import 'package:docicemergency2/src/Services/API.dart';

import 'package:http/http.dart' as http;

class AmbulanceService {
  final String baseUrl = ApiClient.baseUrl;
  Future<bool> confirmEmergency(int emergencyId) async {
    await GlobalData.init();
    final Map<String, dynamic>? profile = GlobalData.myprofile;
    final response = await http.post(
      Uri.parse("$baseUrl/ambulance/confirmAlert/"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'id_emergency': emergencyId,
        'idAmbulance': profile?['id'],
      }),
    );

    if (response.statusCode == 200) {
      print("Emergency confirmed.");
      return true;
    } else {
      print("Failed to confirm emergency: ${response.body}");
      return false;
    }
  }



  Future <AmbulanceModel> getAmbulance() async{
   try {
       await GlobalData.init();
    final Map<String, dynamic>? profile = GlobalData.myprofile;
    final response =await http.post(Uri.parse("$baseUrl/ambulance/getambulance/"),
    headers: {'Content-Type': 'application/json'},
    body:jsonEncode({
      "ambulance_id":profile!['id']
    })
    );
    if (response.statusCode==200) {
      return AmbulanceModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception({"ambulance fialed to get"});
    }
} catch (e) {
  throw Exception({"ambulance fialed to get: $e"});
}
  }
}
