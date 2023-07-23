import 'package:expo_kg/shared/constants/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class SearchHistoryCubit extends Cubit<List<String>> {
  SearchHistoryCubit() : super([]);
  loadHistory() {
    List<String> historyList = [];
    final searchHistoryBox = Hive.box(
      HiveConstants.searchHistoryBox,
    );
    for (var element in searchHistoryBox.values) {
      historyList.add(element);
    }
    emit(
      [
        ...historyList,
        'Наушники',
        'Елка',
      ],
    );
  }

  addHistory(String query) {
    final searchHistoryBox = Hive.box(
      HiveConstants.searchHistoryBox,
    );
    searchHistoryBox.add(query);
    emit(
      [
        ...super.state,
        query,
      ],
    );
  }
}
