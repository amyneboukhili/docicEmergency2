
// ignore_for_file: file_names
import 'dart:core';

class AllergieModel {
  final int? id;
  final int userProfile;
  final String typeAllergie;
  final List<String> allergie;


  AllergieModel({
    this.id,
    required this.userProfile,
    required this.typeAllergie,
    required this.allergie,

  });

  factory AllergieModel.fromJson(Map<String, dynamic> json) {
    return AllergieModel(
      id: json['id'],
      userProfile: json['user_profile'],
      typeAllergie: json['type_allergie'],
      allergie: List<String>.from(json['allergie']),
    );
  }


   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_profile': userProfile,
      'type_allergie': typeAllergie,
      'allergie': allergie,
    };
  }
}