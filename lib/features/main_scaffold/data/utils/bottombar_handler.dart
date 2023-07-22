import 'package:expo_kg/shared/configs/routes.dart';

String bottomNavigationHandler(int index) {
  switch (index) {
    case 0:
      return RoutesNames.home;
    case 1:
      return RoutesNames.favorite;
    case 2:
      return RoutesNames.cart;
    case 3:
      return RoutesNames.profile;
    case 4:
      return RoutesNames.chat;
    default:
      return RoutesNames.home;
  }
}