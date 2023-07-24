import 'package:expo_kg/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:expo_kg/features/profile/presentation/widgets/loggedin.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/not_loggedin.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: marginHV10,
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoggedIn) {
            return ProfileLoggedIn(
              user: state.user,
            );
          }
          return const ProfileNotLoggedIn();
        },
      ),
    );
  }
}
