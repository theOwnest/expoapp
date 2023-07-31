import 'package:equatable/equatable.dart';
import 'package:expo_kg/features/auth/data/models/user.dart';
import 'package:expo_kg/shared/constants/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  init() {
    final loginBox = Hive.box(
      HiveConstants.loginBox,
    );
    if (loginBox.containsKey(
      HiveConstants.user,
    )) {
      final userData =
          Map<String, dynamic>.from(loginBox.get(HiveConstants.user) as Map);
      final user = UserModel.fromMap(userData);
      emit(
        AuthLoggedIn(user: user),
      );
    }
  }

  login(String email, String password) async {
    final loginBox = Hive.box(
      HiveConstants.loginBox,
    );
    final user = UserModel(
      fullName: 'Иван Сергеевич Иванов',
      email: email,
      phone: '+7 (123) 456 78 90',
    );
    loginBox.put(
      HiveConstants.user,
      user.toMap(),
    );
    emit(
      AuthLoggedIn(
        user: user,
      ),
    );
  }

  register(UserModel user) {
    final loginBox = Hive.box(
      HiveConstants.loginBox,
    );
    loginBox.put(
      HiveConstants.user,
      user.toMap(),
    );
    emit(
      AuthLoggedIn(
        user: user,
      ),
    );
    emit(
      AuthLoggedIn(
        user: user,
      ),
    );
  }

  logOut() {
    Hive.box(
      HiveConstants.loginBox,
    ).clear();
    emit(
      AuthInitial(),
    );
  }
}
