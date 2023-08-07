import 'package:flutter_bloc/flutter_bloc.dart';

class ChatSearchController extends Cubit<String?> {
  ChatSearchController() : super(null);
  search(String query) {
    emit(query);
  }
}
