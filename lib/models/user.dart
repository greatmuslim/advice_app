class User {
  String id;
  String name;
  String password;
  String email;
  // String photo;
  String gender;
  String mobile;
  DateTime dob;
  String address;
  bool isEmailVerified;
  String otp;

  User({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
    // required this.photo,
    required this.gender,
    required this.mobile,
    required this.dob,
    required this.address,
    required this.isEmailVerified,
    required this.otp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'mobile': mobile,
      'dob': dob.toIso8601String(),
      'address': address,
      'isEmailVerified': isEmailVerified,
      'otp': otp,
    };
  }
}
