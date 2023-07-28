import 'package:hive_flutter/hive_flutter.dart';

import '../constants/hive.dart';

initHive() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveConstants.appBox);
  await Hive.openBox(HiveConstants.favoriteBox);
  await Hive.openBox(HiveConstants.searchHistoryBox);
}
