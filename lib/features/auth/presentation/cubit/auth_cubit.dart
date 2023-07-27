import 'package:equatable/equatable.dart';
import 'package:expo_kg/features/auth/data/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  login(String email, String password) async {
    emit(
      AuthLoggedIn(
        user: UserModel(
          fullName: 'Иван Сергеевич Иванов',
          email: email,
          phone: '+7 (123) 456 78 90',
        ),
      ),
    );
  }

  register(UserModel user) {
    emit(
      AuthLoggedIn(
        user: user,
      ),
    );
  }

  logOut() {
    emit(
      AuthInitial(),
    );
  }
}
