import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<String?> {
  SearchCubit() : super(null);
  addQuery(String query) {
    if (query.isEmpty) emit(null);
    emit(query);
  }
}
