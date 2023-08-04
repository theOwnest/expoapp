import 'package:equatable/equatable.dart';
import 'package:expo_kg/features/auth/data/models/user.dart';
import 'package:expo_kg/features/merchant/data/models/merchant.dart';
import 'package:expo_kg/features/merchant/data/models/shop.dart';
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
        AuthLoggedInCustomer(user: user),
      );
    }
    initMerchant();
  }

  initMerchant() {
    final loginBox = Hive.box(
      HiveConstants.loginBox,
    );
    if (loginBox.containsKey(
      HiveConstants.merchant,
    )) {
      final userData = Map<String, dynamic>.from(
          loginBox.get(HiveConstants.merchant) as Map);
      final merchant = MerchantModel.fromMap(userData);
      emit(
        AuthLoggedInMerchant(user: merchant),
      );
    }

    if (loginBox.containsKey(
      HiveConstants.shop,
    )) {
      final userData =
          Map<String, dynamic>.from(loginBox.get(HiveConstants.shop) as Map);
      final merchant = MerchantShopModel.fromMap(userData);
      emit(
        AuthLoggedInShop(user: merchant),
      );
    }
  }

  login(String email, String password) async {
    final loginBox = Hive.box(
      HiveConstants.loginBox,
    );
    final user = UserModel(
      userName: 'Иван Сергеевич Иванов',
      email: email,
      phone: '+7 (123) 456 78 90',
    );
    loginBox.put(
      HiveConstants.user,
      user.toMap(),
    );
    emit(
      AuthLoggedInCustomer(
        user: user,
      ),
    );
  }

  changeInfo(UserModel user) async {
    final loginBox = Hive.box(
      HiveConstants.loginBox,
    );
    loginBox.put(
      HiveConstants.user,
      user.toMap(),
    );
    emit(
      AuthLoggedInCustomer(
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
      AuthLoggedInCustomer(
        user: user,
      ),
    );
    emit(
      AuthLoggedInCustomer(
        user: user,
      ),
    );
  }

  addMerchant(MerchantModel merchant) {
    final loginBox = Hive.box(
      HiveConstants.loginBox,
    );
    loginBox.put(
      HiveConstants.merchant,
      merchant.toMap(),
    );
    emit(
      AuthLoggedInMerchant(
        user: merchant,
      ),
    );
  }

  addShop(MerchantShopModel merchant) {
    final loginBox = Hive.box(
      HiveConstants.loginBox,
    );
    loginBox.put(
      HiveConstants.shop,
      merchant.toMap(),
    );
    emit(
      AuthLoggedInShop(
        user: merchant,
      ),
    );
  }

  goToCustomer() {
    final currentState = super.state;
    if (currentState is AuthLoggedInMerchant) {
      final UserModel user = currentState.user;
      emit(
        AuthLoggedInCustomer(user: user),
      );
    } else if (currentState is AuthLoggedInShop) {
      final UserModel user = currentState.user;
      emit(
        AuthLoggedInCustomer(user: user),
      );
    }
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
