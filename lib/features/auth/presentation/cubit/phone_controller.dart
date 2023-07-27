import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneController extends Cubit<String> {
  PhoneController() : super('');
  change(String? phone) {
    if (phone != null) {
      emit(phone);
    }
  }
}
