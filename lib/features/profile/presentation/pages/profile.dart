import 'package:expo_kg/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:expo_kg/features/profile/presentation/widgets/loggedin_merchant.dart';
import 'package:expo_kg/features/profile/presentation/widgets/loggedin_user.dart';
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
          if (state is AuthLoggedInCustomer) {
            return ProfileLoggedInUser(
              user: state.user,
            );
          }
          if (state is AuthLoggedInMerchant) {
            return ProfileLoggedInMerchant(
              user: state.user,
            );
          }
          if (state is AuthLoggedInShop) {
            return ProfileLoggedInMerchant(
              user: state.user,
            );
          }
          return const ProfileNotLoggedIn();
        },
      ),
    );
  }
}
