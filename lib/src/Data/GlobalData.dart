import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
class GlobalData {
static late SharedPreferences _prefs;
  static Map<String, dynamic>? myprofile;
  static String? token;
  

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    String? profile = _prefs.getString('profile');
    myprofile= jsonDecode(profile!);
    token = _prefs.getString('token');
  }
}