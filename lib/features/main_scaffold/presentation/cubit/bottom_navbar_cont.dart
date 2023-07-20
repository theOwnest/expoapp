import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavbarCont extends Cubit<int> {
  BottomNavbarCont() : super(0);
  change(int index){
    emit(index);
  }
}
