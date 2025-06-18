class FicheEntecedent {
  final int? id;
  final int userProfile;
  final int age;
  final String gender;
  final int taille;
  final int pois;
  final String bloodType;

  FicheEntecedent({
     this.id,
    required this.userProfile,
    required this.age,
    required this.gender,
    required this.taille,
    required this.pois,
    required this.bloodType,
  });

  factory FicheEntecedent.fromJson(Map<String, dynamic> json) {
    return FicheEntecedent(
      id: json['id'],
      userProfile: json['user_profile'],
      age: double.parse(json['age'].toString()).toInt(), 
      gender: json['gender'],
      taille: double.parse(json['taille'].toString()).toInt(),
      pois:double.parse(json['pois'].toString()).toInt(),
      bloodType: json['blood_type'],
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'user_profile': userProfile,
      'age': age,
      'gender': gender,
      'taille': taille,
      'pois':pois,
      'blood_type': bloodType,
    };
  }
}
