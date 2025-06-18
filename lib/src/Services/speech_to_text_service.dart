import 'dart:convert';
import 'dart:io';

import 'package:docicemergency2/src/Models/emergency_description.dart';
import 'package:docicemergency2/src/Services/API.dart';
import 'package:http/http.dart' as http;

class SpeechToTextService {
  final String baseUrl = ApiClient.baseUrl;

  Future<String?> transcribeWithWhisper(String path) async {
    final file = File(path);
    final uri = Uri.parse('https://api.openai.com/v1/audio/transcriptions');

    final request = http.MultipartRequest('POST', uri)
      ..headers['Authorization'] =
          'Bearer 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'
      ..fields['model'] = 'whisper-1'
      ..files.add(await http.MultipartFile.fromPath('file', file.path));

    final response = await request.send();
    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final result = jsonDecode(respStr);
      return result['text'];
    } else {
      print('Whisper Error: $respStr');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getDescriptionByAmbulanceAndEmergency({
    required int ambulanceId,
    required int emergencyId,
  }) async {
    final url = Uri.parse(
      '$baseUrl/emergency-description/ambulance/$ambulanceId/emergency/$emergencyId/',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else if (response.statusCode == 404) {
        print("Description not found.");
        return null;
      } else {
        print(
          "Failed to load description. Status code: ${response.statusCode}",
        );
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<bool> addEmergencyDescription(EmergencyDescription desc) async {
    final url = Uri.parse('$baseUrl/description/add/');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(desc.toJson()),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        print('Failed to create description: ${response.statusCode}');
        print('Error: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Exception during addEmergencyDescription: $e');
      return false;
    }
  }
}
