import 'package:expo_kg/features/cart/presentation/pages/cart.dart';
import 'package:expo_kg/features/chat/presentation/pages/chat.dart';
import 'package:expo_kg/features/favorite/presentation/pages/favorite.dart';
import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/features/home/presentation/pages/home.dart';
import 'package:expo_kg/features/main_scaffold/presentation/cubit/bottom_navbar_cont.dart';
import 'package:expo_kg/features/main_scaffold/presentation/widgets/bottom_navbar.dart';
import 'package:expo_kg/features/profile/presentation/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),
      const FavoritePage(),
      const CartPage(),
      const ProfilePage(),
      const ChatPage(),
    ];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavbarCont(),
        ),
        BlocProvider(
          create: (context) => ProductCubit()..load(),
        ),
      ],
      child: Builder(builder: (context) {
        return KeyboardDismisser(
          child: Scaffold(
            body: SafeArea(
              child: BlocBuilder<BottomNavbarCont, int>(
                builder: (context, state) {
                  return pages[state];
                },
              ),
            ),
            bottomNavigationBar: const MainBottomNavbar(),
          ),
        );
      }),
    );
  }
}
