import 'dart:io';

import 'package:expo_kg/features/profile/data/utils/pick_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopImagesCubit extends Cubit<List<File>> {
  ShopImagesCubit() : super([]);
  addImage() async {
    final image = await pickImage();
    if (image != null) {
      emit(
        [
          ...super.state,
          image,
        ],
      );
    }
  }
}
