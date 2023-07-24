part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoggedIn extends AuthState {
  final UserModel user;
  AuthLoggedIn({
    required this.user,
  });
  @override
  List<Object?> get props => [user];
}
