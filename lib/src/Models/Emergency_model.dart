class EmergencyModel {
  final int? id;
  final int userProfile;
  final DateTime dateEmergency;
  final int fiche;
  final List<int> allergie;
  // LOCATION
  final String late;
  final String long;
  final String statut;
  EmergencyModel({
    this.id,
    required this.userProfile,
    required this.dateEmergency,
    required this.fiche,
    required this.allergie,
    required this.late,
    required this.long,
    required this.statut,
  });

  factory EmergencyModel.fromJson(Map<String, dynamic> json) {
    return EmergencyModel(
        id: json['id'],
        userProfile: json['user_profile'],
        dateEmergency: DateTime.parse(json['dateEmergency']),
        fiche: json['fiche'],
        allergie: List<int>.from(json['allergies']),
        late: json['latitude'],
        long: json['longitude'],
        statut: json['statut']);
  }

  Map<String, dynamic> toJson() {
    return {
      'user_profile': userProfile,
      'dateEmergency': dateEmergency.toIso8601String(),
      'fiche': fiche,
      'allergies': allergie,
      'latitude': late,
      'longitude': long,
      'statut': statut,
    };
  }
}
