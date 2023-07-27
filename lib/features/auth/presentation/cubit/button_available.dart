import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonAvailableCont extends Cubit<bool> {
  ButtonAvailableCont() : super(false);
  change(bool isAvailable) {
    emit(isAvailable);
  }
}
