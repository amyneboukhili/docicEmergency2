import 'dart:convert';

import 'package:docicemergency2/src/Data/GlobalData.dart';
import 'package:docicemergency2/src/Models/allergies_model.dart';
import 'package:docicemergency2/src/Services/API.dart';
import 'package:http/http.dart' as http;

class AllergieService {
  final String baseUrl = ApiClient.baseUrl;

  
  Future<List<AllergieModel>> getMyAllergies() async {
    try {
      await GlobalData.init();
      final Map<String, dynamic>? profile = GlobalData.myprofile;
      final response =
          await http.post(Uri.parse("$baseUrl/allergie/getallergie/"),
              headers: {
                'Content-Type': 'application/json',
              },
              body: jsonEncode({"user_profile": profile!["id"]}));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => AllergieModel.fromJson(item)).toList();
      } else {
        throw Exception("Server responded with status ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("API Error: $e");
    }
  }

}
