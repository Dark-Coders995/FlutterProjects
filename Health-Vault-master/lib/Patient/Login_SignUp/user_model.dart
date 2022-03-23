class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? blood_group;
  String? sugar_level;
  String? blood_pressure;

  UserModel({this.uid, this.email, this.firstName, this.secondName , this.sugar_level , this.blood_pressure , this.blood_group});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      blood_group: map['BloodGroup'],
      sugar_level: map['SugarLevel'],
      blood_pressure: map['BloodPressure'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'BloodGroup': blood_group,
      'SugarLevel': sugar_level,
      'BloodPressure': blood_pressure,
    };
  }
}
