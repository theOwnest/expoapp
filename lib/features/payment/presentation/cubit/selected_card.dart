import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedCard extends Cubit<int> {
  SelectedCard() : super(0);
  change(int index) {
    emit(index);
  }
}
