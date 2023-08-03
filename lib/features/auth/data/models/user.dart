class UserModel {
  final String userName;
  final String email;
  final String phone;
  UserModel({
    required this.userName,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'email': email,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'],
      email: map['email'],
      phone: map['phone'],
    );
  }
}
