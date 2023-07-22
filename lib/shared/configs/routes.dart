import 'dart:developer';
import 'package:expo_kg/features/category/presentation/pages/category.dart';
import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/features/main_scaffold/presentation/pages/main_scaffold.dart';
import 'package:expo_kg/features/onboarding/presentation/cubit/onboarding_shown.dart';
import 'package:expo_kg/features/onboarding/presentation/pages/onboarding.dart';
import 'package:expo_kg/features/product/presentation/pages/product.dart';
import 'package:expo_kg/features/product/presentation/pages/shop.dart';
import 'package:expo_kg/shared/widgets/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:expo_kg/features/cart/presentation/pages/cart.dart';
import 'package:expo_kg/features/chat/presentation/pages/chat.dart';
import 'package:expo_kg/features/favorite/presentation/pages/favorite.dart';
import 'package:expo_kg/features/home/presentation/pages/home.dart';
import 'package:expo_kg/features/profile/presentation/pages/profile.dart';

class Routes {
  static String home = '/';
  static String category = '/category';
  static String favorite = '/favorite';
  static String cart = '/cart';
  static String profile = '/profile';
  static String chat = '/chat';
  static String productInfo = '/productInfo';
  static String shopInfo = '/shopInfo';
  static String onboarding = '/onboarding';
}

class RoutesNames {
  static String home = 'home';
  static String category = 'category';
  static String favorite = 'favorite';
  static String cart = 'cart';
  static String profile = 'profile';
  static String chat = 'chat';
  static String productInfo = 'productInfo';
  static String shopInfo = 'shopInfo';
  static String onboarding = 'onboarding';
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => MainScaffold(
        key: state.pageKey,
        child: child,
      ),
      routes: [
        GoRoute(
          path: Routes.home,
          name: RoutesNames.home,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomePage(),
          ),
        ),
        GoRoute(
          path: Routes.favorite,
          name: RoutesNames.favorite,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: FavoritePage(),
          ),
        ),
        GoRoute(
          path: Routes.cart,
          name: RoutesNames.cart,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: CartPage(),
          ),
        ),
        GoRoute(
          path: Routes.profile,
          name: RoutesNames.profile,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ProfilePage(),
          ),
        ),
        GoRoute(
          path: Routes.chat,
          name: RoutesNames.chat,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ChatPage(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: Routes.category,
      name: RoutesNames.category,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: CategoryPage(),
      ),
    ),
    GoRoute(
      path: Routes.productInfo,
      name: RoutesNames.productInfo,
      parentNavigatorKey: _rootNavigatorKey,
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
    ),
    GoRoute(
      path: Routes.shopInfo,
      name: RoutesNames.shopInfo,
      parentNavigatorKey: _rootNavigatorKey,
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
    GoRoute(
      path: Routes.onboarding,
      name: RoutesNames.onboarding,
      parentNavigatorKey: _rootNavigatorKey,
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
