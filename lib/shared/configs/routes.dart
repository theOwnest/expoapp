import 'dart:developer';
import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/features/main_scaffold/presentation/pages/main_scaffold.dart';
import 'package:expo_kg/features/onboarding/presentation/cubit/onboarding_shown.dart';
import 'package:expo_kg/features/onboarding/presentation/pages/onboarding.dart';
import 'package:expo_kg/features/product/presentation/pages/product.dart';
import 'package:expo_kg/features/product/presentation/pages/shop.dart';
import 'package:expo_kg/shared/widgets/error_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String main = '/';
  static String productInfo = 'productInfo';
  static String shopInfo = 'shopInfo';
  static String onboarding = '/onboarding';
}

class RoutesNames {
  static String main = 'main';
  static String productInfo = 'productInfo';
  static String shopInfo = 'shopInfo';
  static String onboarding = 'onboarding';
}

final GoRouter router = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: Routes.main,
      name: RoutesNames.main,
      builder: (context, state) => const MainScaffold(),
      routes: [
        GoRoute(
          path: Routes.productInfo,
          name: RoutesNames.productInfo,
          builder: (context, state) {
            log(state.location);
            final productId = state.queryParameters['productId'] as String;
            final productCubit = state.extra as ProductCubit;
            return BlocProvider.value(
              value: productCubit,
              child: ProductPage(
                productId: productId,
              ),
            );
          },
          routes: [
            GoRoute(
              path: Routes.shopInfo,
              name: RoutesNames.shopInfo,
              builder: (context, state) {
                log(state.location);
                final productId = state.queryParameters['productId'] as String;
                final productCubit = state.extra as ProductCubit;
                return BlocProvider.value(
                  value: productCubit,
                  child: ShopInfoPage(
                    productId: productId,
                  ),
                );
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.onboarding,
      name: RoutesNames.onboarding,
      builder: (context, state) => BlocProvider.value(
        value: BlocProvider.of<OnboardingShown>(context),
        child: const OnboardingPage(),
      ),
    ),
  ],
  redirect: (context, state) {
    if (!context.read<OnboardingShown>().state) {
      return Routes.onboarding;
    }
    return null;
  },
);
