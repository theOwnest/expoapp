import 'package:expo_kg/features/auth/data/models/user.dart';

class AnketaModel {
  final String fullName;
  final String email;
  final String phone;
  AnketaModel({
    this.fullName = '',
    this.email = '',
    this.phone = '',
  });
  factory AnketaModel.fromUser(UserModel user) {
    return AnketaModel(
      email: user.email,
      fullName: user.fullName,
      phone: user.phone,
    );
  }
}
