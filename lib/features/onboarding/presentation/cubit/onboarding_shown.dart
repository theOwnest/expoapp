import 'package:expo_kg/shared/constants/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class OnboardingShown extends Cubit<bool> {
  OnboardingShown() : super(false);
  load() {
    final appBox = Hive.box(
      HiveConstants.appBox,
    );
    if (appBox.containsKey(
      HiveConstants.onboardShown,
    )) {
      emit(true);
    }
  }

  writeShown() {
    final appBox = Hive.box(
      HiveConstants.appBox,
    );
    appBox.put(
      HiveConstants.onboardShown,
      true,
    );
    emit(true);
  }
}
