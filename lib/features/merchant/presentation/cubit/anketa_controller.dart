import 'package:expo_kg/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:expo_kg/features/merchant/data/models/anketa.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnketaController extends Cubit<AnketaModel> {
  AnketaController()
      : super(
          AnketaModel(),
        );
  init(AuthState authState) {
    if (authState is AuthLoggedIn) {
      emit(
        AnketaModel.fromUser(
          authState.user,
        ),
      );
    }
  }

  change({String? fullName, String? email, String? phone}) {
    emit(
      AnketaModel(
        fullName: fullName ?? super.state.fullName,
        email: email ?? super.state.email,
        phone: phone ?? super.state.phone,
      ),
    );
  }
}
