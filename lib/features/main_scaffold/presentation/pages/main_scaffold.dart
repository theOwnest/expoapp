import 'package:expo_kg/features/main_scaffold/presentation/cubit/bottom_navbar_cont.dart';
import 'package:expo_kg/features/main_scaffold/presentation/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavbarCont(),
      child: Scaffold(
        body: child,
        bottomNavigationBar: const MainBottomNavbar(),
      ),
    );
  }
}
