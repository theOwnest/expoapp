import 'package:expo_kg/features/auth/data/models/user.dart';

class MerchantModel extends UserModel {
  final String shopName;
  final String description;
  final String messenger;
  final String workPhone;
  MerchantModel({
    required super.userName,
    required super.email,
    required super.phone,
    required this.shopName,
    required this.description,
    required this.messenger,
    required this.workPhone,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'email': email,
      'phone': phone,
      'shopName': shopName,
      'description': description,
      'messenger': messenger,
      'workPhone': workPhone,
    };
  }

  factory MerchantModel.fromMap(Map<String, dynamic> map) {
    return MerchantModel(
      userName: map['userName'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      shopName: map['shopName'] as String,
      description: map['description'] as String,
      messenger: map['messenger'] as String,
      workPhone: map['workPhone'] as String,
    );
  }
}
