import 'dart:convert';

import 'package:docicemergency2/src/Data/GlobalData.dart';
import 'package:docicemergency2/src/Services/API.dart';
import 'package:http/http.dart' as http;

class EmergencyService {
  final String baseUrl = ApiClient.baseUrl;
  Future <Map<String, dynamic>> getEmegency()async{
    try {
      await GlobalData.init();
      final Map<String, dynamic>? profile = GlobalData.myprofile;
      if (profile==null) {
        throw Exception("u dont have a profile id ");
      }
   final  responce= await  http.post(Uri.parse("$baseUrl/emergency/emergencyDetails/"),
   headers: {
      'Content-Type': 'application/json',
   },
   body: jsonEncode({'idAmbulance':profile["id"]}));
    if (responce.statusCode == 200) {
      final data = jsonDecode(responce.body);
      return data;
    } else {
      throw Exception("API Error: ${responce.body}");
    }
    } catch (e) {
       throw Exception("API Error: $e");
    }
     
  }

  Future <bool> makeitDone(int id)async{
 try {
      await GlobalData.init();
      final Map<String, dynamic>? profile = GlobalData.myprofile;
      if (profile==null) {
        throw Exception("u dont have a profile id ");
      }

   final  response = await http.post(Uri.parse("$baseUrl/emergency/emrgencydone/"),
   headers: {
     'Content-Type': 'application/json',
   },
   body: jsonEncode({"idemergncy":id, "ambulanceId":profile["id"]}));

   if (response.statusCode==200) {
     return true;
   }
   else{
    throw Exception("Server responded with status ${response.statusCode}");
   }
 } catch (e) {
   throw Exception("api erreur: $e ");
 }
}



 
}