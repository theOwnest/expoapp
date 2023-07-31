import 'dart:developer';

import 'package:expo_kg/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:expo_kg/features/auth/presentation/pages/anketa.dart';
import 'package:expo_kg/features/auth/presentation/pages/congratulation.dart';
import 'package:expo_kg/features/auth/presentation/pages/login.dart';
import 'package:expo_kg/features/auth/presentation/pages/register.dart';
import 'package:expo_kg/features/auth/presentation/pages/sms_code.dart';
import 'package:expo_kg/features/cart/presentation/pages/cart.dart';
import 'package:expo_kg/features/category/presentation/pages/category.dart';
import 'package:expo_kg/features/category/presentation/pages/subcategory.dart';
import 'package:expo_kg/features/chat/presentation/pages/chat.dart';
import 'package:expo_kg/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:expo_kg/features/favorite/presentation/pages/favorite.dart';
import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/features/home/presentation/pages/home.dart';
import 'package:expo_kg/features/main_scaffold/presentation/pages/main_scaffold.dart';
import 'package:expo_kg/features/onboarding/presentation/cubit/onboarding_shown.dart';
import 'package:expo_kg/features/onboarding/presentation/pages/onboarding.dart';
import 'package:expo_kg/features/product/presentation/pages/product.dart';
import 'package:expo_kg/features/product/presentation/pages/shop.dart';
import 'package:expo_kg/features/profile/data/models/order.dart';
import 'package:expo_kg/features/profile/presentation/pages/order_history.dart';
import 'package:expo_kg/features/order/presentation/pages/order_info.dart';
import 'package:expo_kg/features/profile/presentation/pages/order_tracking.dart';
import 'package:expo_kg/features/profile/presentation/pages/profile.dart';
import 'package:expo_kg/features/search/presentation/pages/search.dart';
import 'package:expo_kg/shared/constants/cubit_strings.dart';
import 'package:expo_kg/shared/models/multiple_cubits.dart';
import 'package:expo_kg/shared/widgets/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String home = '/';
  static String favorite = '/favorite';
  static String cart = '/cart';
  static String profile = '/profile';
  static String chat = '/chat';

  static String productInfo = '/productInfo';
  static String shopInfo = '/shopInfo';

  static String profileOrderHistory = '/profileOrderHistory';
  static String profileOrderTracking = '/profileOrderTracking';
  static String orderInfo = '/orderInfo';

  static String category = '/category';
  static String subcategory = '/subcategory';
  static String search = '/search';

  static String onboarding = '/onboarding';
  static String login = '/login';
  static String register = '/register';
  static String smscode = '/smscode';
  static String anketa = '/anketa';
  static String congrats = '/congrats';
}

class RoutesNames {
  static String home = 'home';
  static String favorite = 'favorite';
  static String cart = 'cart';
  static String profile = 'profile';
  static String chat = 'chat';

  static String productInfo = 'productInfo';
  static String shopInfo = 'shopInfo';

  static String profileOrderHistory = 'profileOrderHistory';
  static String profileOrderTracking = 'profileOrderTracking';
  static String orderInfo = 'orderInfo';

  static String category = 'category';
  static String subcategory = 'subcategory';
  static String search = 'search';

  static String onboarding = 'onboarding';
  static String login = 'login';
  static String register = 'register';
  static String smscode = 'smscode';
  static String anketa = 'anketa';
  static String congrats = 'congrats';
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
      path: Routes.search,
      name: RoutesNames.search,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SearchPage(),
      ),
    ),
    GoRoute(
      path: Routes.subcategory,
      name: RoutesNames.subcategory,
      pageBuilder: (context, state) {
        log(state.location);
        final category = state.queryParameters['category'] as String;
        final productCubit = state.extra as ProductCubit;
        return NoTransitionPage(
          child: BlocProvider.value(
            value: productCubit,
            child: SubcategoryPage(
              category: category,
            ),
          ),
        );
      },
    ),
    GoRoute(
      path: Routes.productInfo,
      name: RoutesNames.productInfo,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        log(state.location);
        final productId = state.queryParameters['productId'] as String;
        final cubits = state.extra as MultipleCubits;
        final productsCubit =
            cubits.cubits[CubitStrings.productsCubit] as ProductCubit;
        final favoritesCubit =
            cubits.cubits[CubitStrings.favoritesCubit] as FavoriteCubit;
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: productsCubit,
            ),
            BlocProvider.value(
              value: favoritesCubit,
            ),
          ],
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
        final cubits = state.extra as MultipleCubits;
        final productsCubit =
            cubits.cubits[CubitStrings.productsCubit] as ProductCubit;
        final favoritesCubit =
            cubits.cubits[CubitStrings.favoritesCubit] as FavoriteCubit;
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: productsCubit,
            ),
            BlocProvider.value(
              value: favoritesCubit,
            ),
          ],
          child: ShopInfoPage(
            productId: productId,
          ),
        );
      },
    ),
    //Profile pages
    GoRoute(
      path: Routes.profileOrderHistory,
      name: RoutesNames.profileOrderHistory,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: OrderHistory(),
      ),
    ),
    GoRoute(
      path: Routes.profileOrderTracking,
      name: RoutesNames.profileOrderTracking,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: OrderTracking(),
      ),
    ),
    GoRoute(
      path: Routes.orderInfo,
      name: RoutesNames.orderInfo,
      pageBuilder: (context, state) => NoTransitionPage(
        child: OrderInfo(
          order: state.extra as OrderModel,
        ),
      ),
    ),
    //Outer pages
    GoRoute(
      path: Routes.onboarding,
      name: RoutesNames.onboarding,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => BlocProvider.value(
        value: BlocProvider.of<OnboardingShown>(context),
        child: const OnboardingPage(),
      ),
    ),
    GoRoute(
      path: Routes.login,
      name: RoutesNames.login,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => BlocProvider.value(
        value: BlocProvider.of<AuthCubit>(context),
        child: const LoginPage(),
      ),
    ),
    GoRoute(
      path: Routes.register,
      name: RoutesNames.register,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => BlocProvider.value(
        value: BlocProvider.of<AuthCubit>(context),
        child: const RegisterPage(),
      ),
    ),
    GoRoute(
      path: Routes.smscode,
      name: RoutesNames.smscode,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => BlocProvider.value(
        value: BlocProvider.of<AuthCubit>(context),
        child: SmsCodePage(
          phone: state.queryParameters['phone'] as String,
        ),
      ),
    ),
    GoRoute(
      path: Routes.anketa,
      name: RoutesNames.anketa,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => BlocProvider.value(
        value: BlocProvider.of<AuthCubit>(context),
        child: AnketaPage(
          phone: state.queryParameters['phone'] as String,
        ),
      ),
    ),
    GoRoute(
      path: Routes.congrats,
      name: RoutesNames.congrats,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const RegisterCongratulationPage(),
    ),
  ],
  redirect: (context, state) {
    if (!context.read<OnboardingShown>().state) {
      return Routes.onboarding;
    }
    return null;
  },
);
