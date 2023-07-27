import 'package:flutter_bloc/flutter_bloc.dart';

class SmsController extends Cubit<String> {
  SmsController() : super('');
  change(String? phone) {
    if (phone != null) {
      emit(phone);
    }
  }
}
