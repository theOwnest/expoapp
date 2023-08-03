part of 'merchant_anketa_cubit.dart';

class MerchantAnketaState extends Equatable {
  const MerchantAnketaState({
    this.anketa,
    this.inn,
    this.openedDate,
    this.photos,
    this.address,
    this.website,
    this.shopName,
    this.description,
    this.messenger,
    this.workPhone,
  });
  final AnketaModel? anketa;
  final String? inn;
  final String? openedDate;
  final List<String>? photos;
  final AddressModel? address;
  final String? website;
  final String? shopName;
  final String? description;
  final String? messenger;
  final String? workPhone;

  @override
  List<dynamic> get props => [
        anketa,
        inn,
        openedDate,
        photos,
        address,
        website,
        shopName,
        description,
        messenger,
        workPhone,
      ];
  get getshop => MerchantShopModel(
        userName: anketa?.fullName ?? '',
        email: anketa?.email ?? '',
        phone: anketa?.phone ?? '',
        address: address ??
            AddressModel(
              name: '',
              latitude: 0,
              longitude: 0,
            ),
        description: description ?? '',
        inn: inn ?? '',
        messenger: messenger ?? '',
        openedDate: openedDate ?? '',
        photos: photos ?? [],
        shopName: shopName ?? '',
        website: website ?? '',
        workPhone: workPhone ?? '',
      );
  get getMerchant => MerchantModel(
        userName: anketa?.fullName ?? '',
        email: anketa?.email ?? '',
        phone: anketa?.phone ?? '',
        description: description ?? '',
        messenger: messenger ?? '',
        shopName: shopName ?? '',
        workPhone: workPhone ?? '',
      );
}
