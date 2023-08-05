import 'package:equatable/equatable.dart';
import 'package:expo_kg/features/chat/data/datasources/chats.dart';
import 'package:expo_kg/features/chat/data/models/chat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState([]));
  load() async {
    emit(
      ChatState(
        [
          ...chatList,
        ],
      ),
    );
  }

  ChatModel getById(String id) {
    return super.state.chats.firstWhere(
          (element) => element.id == id,
        );
  }
}
