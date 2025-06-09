class AmbulanceModel {
  final String serieNumber;
  final String password;
  final String driverName;
  final String stafNumber;
  final bool isAvailable;
  final String? locationLat;
  final String? locationLng;

  AmbulanceModel({
    required this.serieNumber,
    required this.password,
    required this.driverName,
    required this.stafNumber,
    this.locationLat,
    this.locationLng,
    this.isAvailable = true,
  });
  factory AmbulanceModel.fromJson(Map<String, dynamic> json) {
    return AmbulanceModel(
      serieNumber: json['serieNumber'],
      password: json['password'],
      driverName: json['driver_name'],
      stafNumber: json['staf_number'],
      isAvailable: json['is_available'] ?? true,
      locationLat: json['location_lat'],
      locationLng: json['location_lng'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serieNumber': serieNumber,
      'password': password,
      'driver_name': driverName,
      'staf_number': stafNumber,
      'is_available': isAvailable,
      'location_lat': locationLat,
      'location_lng': locationLng,
    };
  }
}
