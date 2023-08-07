import 'dart:io';

import 'package:expo_kg/features/profile/data/utils/pick_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImageCubit extends Cubit<File?> {
  ProfileImageCubit() : super(null);
  addImage() async {
    final image = await pickImage();
    if (image != null) {
      emit(image);
    }
  }
}
