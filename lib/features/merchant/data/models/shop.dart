import 'package:expo_kg/features/map/data/models/address.dart';
import 'package:expo_kg/features/merchant/data/models/merchant.dart';

class MerchantShopModel extends MerchantModel {
  final String inn;
  final String openedDate;
  final List<String> photos;
  final AddressModel address;
  final String website;
  MerchantShopModel({
    required super.userName,
    required super.email,
    required super.phone,
    required super.shopName,
    required super.description,
    required super.messenger,
    required super.workPhone,
    required this.inn,
    required this.openedDate,
    required this.photos,
    required this.address,
    required this.website,
  });
  factory MerchantShopModel.empty() {
    return MerchantShopModel(
      userName: '',
      email: '',
      phone: '',
      shopName: '',
      description: '',
      messenger: '',
      workPhone: '',
      inn: '',
      openedDate: '',
      photos: [],
      address: AddressModel(
        name: '',
        latitude: 0,
        longitude: 0,
      ),
      website: '',
    );
  }

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
      'inn': inn,
      'openedDate': openedDate,
      'photos': photos,
      'address': address.toMap(),
      'website': website,
    };
  }

  factory MerchantShopModel.fromMap(Map<String, dynamic> map) {
    return MerchantShopModel(
      userName: map['userName'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      shopName: map['shopName'] as String,
      description: map['description'] as String,
      messenger: map['messenger'] as String,
      workPhone: map['workPhone'] as String,
      inn: map['inn'] as String,
      openedDate: map['openedDate'] as String,
      photos: List<String>.from(
        (map['photos'] as List<String>),
      ),
      address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
      website: map['website'] as String,
    );
  }
}
