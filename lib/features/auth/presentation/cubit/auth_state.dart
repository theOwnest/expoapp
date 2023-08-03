part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoggedInCustomer extends AuthState {
  final UserModel user;
  AuthLoggedInCustomer({
    required this.user,
  });
  @override
  List<Object?> get props => [user];
}

class AuthLoggedInMerchant extends AuthState {
  final MerchantModel user;
  AuthLoggedInMerchant({
    required this.user,
  });
  @override
  List<Object?> get props => [user];
}

class AuthLoggedInShop extends AuthState {
  final MerchantShopModel user;
  AuthLoggedInShop({
    required this.user,
  });
  @override
  List<Object?> get props => [user];
}
