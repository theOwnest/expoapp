import 'package:expo_kg/features/search/data/datasources/filter_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<Map<String, String>> {
  FilterCubit(Map<String, String> filter)
      : super(
          filter,
        );
  addFilter({String? category, String? search}) {
    Map<String, String> filter = {...super.state};
    if (category != null) {
      filter[FilterConstants.category] = category;
    }
    if (search != null) {
      filter[FilterConstants.search] = search;
    }
    emit(
      filter,
    );
  }
}
