import 'package:expo_kg/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:expo_kg/features/onboarding/presentation/cubit/onboarding_shown.dart';
import 'package:expo_kg/shared/utils/init_hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shared/configs/routes.dart';
import 'shared/configs/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => OnboardingShown()..load(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(
          375,
          812,
        ),
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'ExpoKG',
          theme: mainTheme,
          routerConfig: router,
        ),
      ),
    );
  }
}
