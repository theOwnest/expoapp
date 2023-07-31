class UserModel {
  final String fullName;
  final String email;
  final String phone;
  UserModel({
    required this.fullName,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'email': email,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map['fullName'],
      email: map['email'],
      phone: map['phone'],
    );
  }
}
