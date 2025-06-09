import 'dart:convert';

import 'package:docicemergency2/src/Models/ambulance_model.dart';
import 'package:docicemergency2/src/Services/API.dart';
import 'package:http/http.dart' as http;
class AuthService {
  final String baseUrl = ApiClient.baseUrl;
Future<bool> singup(AmbulanceModel profile) async {
  final response = await http.post(
    Uri.parse("$baseUrl/ambulance/add/"),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(profile.toJson()),
  );

  if (response.statusCode == 201 || response.statusCode == 200) {
    return true;
  } else {
    throw Exception("Signup Error: ${response.body}");
  }
}



Future<Map<String, dynamic>> login(String number,String pass)async{
try {
    final response = await http.post(
    Uri.parse("$baseUrl/ambulance/login/"),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({'serieNumber': number, 'password': pass}),
  );
  if (response.statusCode==200) {
     return jsonDecode(response.body);
   }
   else{
    throw Exception("Server responded with status ${response.statusCode}");
   }
 } catch (e) {
   throw Exception("api erreur: $e ");
 }
  
}

}