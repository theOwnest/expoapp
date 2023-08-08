// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:expo_kg/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:expo_kg/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:expo_kg/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/features/main_scaffold/presentation/cubit/bottom_navbar_cont.dart';
import 'package:expo_kg/features/main_scaffold/presentation/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../cubit/location_cubit.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavbarCont(),
        ),
        BlocProvider(
          create: (context) => ProductCubit()..load(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit()..load(),
        ),
        BlocProvider(
          create: (context) => CartCubit()..load(),
        ),
        BlocProvider(
          create: (context) => ChatCubit()..load(),
        ),
        BlocProvider(
          create: (context) => LocationCubit()..getLocation(),
        ),
      ],
      child: KeyboardDismisser(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(child: child),
          bottomNavigationBar: const MainBottomNavbar(),
        ),
      ),
    );
  }
}
