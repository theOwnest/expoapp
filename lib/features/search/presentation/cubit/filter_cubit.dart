import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit(FilterState filterState)
      : super(
          filterState,
        );
  addFilter({String? category}) {
    emit(
      FilterState(
        category: category ?? super.state.category,
      ),
    );
  }
}
