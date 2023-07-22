import 'package:expo_kg/shared/configs/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("Error Screen"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => context.goNamed(
              RoutesNames.home,
            ),
            child: const Text("Go to home page"),
          ),
        ),
      ),
    );
  }
}
