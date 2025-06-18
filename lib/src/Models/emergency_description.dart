class EmergencyDescription {
  final int ?id;
  final int emergencyId;
  final int ambulanceId;
  final String description;
  final String situationType;
  final DateTime? createdAt;

  EmergencyDescription({
    this.id,
    required this.emergencyId,
    required this.ambulanceId,
    required this.description,
    required this.situationType,
   this.createdAt,
  });

  factory EmergencyDescription.fromJson(Map<String, dynamic> json) {
    return EmergencyDescription(
      id: json['id'],
      emergencyId: json['emergency_id'],
      ambulanceId: json['ambulance'],
      description: json['description'],
      situationType: json['situation_type'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'emergency_id': emergencyId,
      'ambulance': ambulanceId,
      'description': description,
      'situation_type': situationType,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
