class UserModel {
  String? blood_group;
  String? sugar_level;
  String? blood_pressure;

  UserModel({ this.sugar_level , this.blood_pressure , this.blood_group});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      blood_group: map['BloodGroup'],
      sugar_level: map['SugarLevel'],
      blood_pressure: map['BloodPressure'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'BloodGroup': blood_group,
      'SugarLevel': sugar_level,
      'BloodPressure': blood_pressure,
    };
  }
}
