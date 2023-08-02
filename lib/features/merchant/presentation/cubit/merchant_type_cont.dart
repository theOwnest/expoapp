import 'package:expo_kg/features/merchant/data/enums/merchant_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MerchantTypeCont extends Cubit<MerchantTypeEnum> {
  MerchantTypeCont()
      : super(
          MerchantTypeEnum.shop,
        );
  change(MerchantTypeEnum type) {
    emit(type);
  }
}
