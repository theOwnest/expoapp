import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:expo_kg/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:expo_kg/features/map/data/models/address.dart';
import 'package:expo_kg/features/merchant/data/models/anketa.dart';
import 'package:expo_kg/features/merchant/data/models/merchant.dart';
import 'package:expo_kg/features/merchant/data/models/shop.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_anketa_state.dart';

class MerchantAnketaCubit extends Cubit<MerchantAnketaState> {
  MerchantAnketaCubit()
      : super(
          const MerchantAnketaState(),
        );
  init(AuthState authState) {
    if (authState is AuthLoggedInCustomer) {
      emit(
        MerchantAnketaState(
          anketa: AnketaModel.fromUser(
            authState.user,
          ),
        ),
      );
    }
  }

  change({
    String? fullName,
    String? email,
    String? phone,
    String? inn,
    String? openedDate,
    List<String>? photos,
    AddressModel? address,
    String? website,
    String? shopName,
    String? description,
    String? messenger,
    String? workPhone,
  }) {
    log('Changing');
    emit(
      MerchantAnketaState(
        anketa: AnketaModel(
          fullName: fullName ?? super.state.anketa?.fullName ?? '',
          email: email ?? super.state.anketa?.email ?? '',
          phone: phone ?? super.state.anketa?.phone ?? '',
        ),
        address: address ?? super.state.address,
        description: description ?? super.state.description,
        inn: inn ?? super.state.inn,
        messenger: messenger ?? super.state.messenger,
        openedDate: openedDate ?? super.state.openedDate,
        photos: photos ?? super.state.photos,
        shopName: shopName ?? super.state.shopName,
        website: website ?? super.state.website,
        workPhone: workPhone ?? super.state.workPhone,
      ),
    );
  }
}
