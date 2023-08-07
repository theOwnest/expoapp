import 'package:equatable/equatable.dart';
import 'package:expo_kg/features/chat/data/datasources/chats.dart';
import 'package:expo_kg/features/chat/data/models/chat.dart';
import 'package:expo_kg/features/chat/data/models/message.dart';
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

  typeMessage(String chatId, MessageModel message) {
    List<ChatModel> chats = [...super.state.chats];
    List<MessageModel> messages = [
      ...super
          .state
          .chats
          .firstWhere((element) => element.id == chatId)
          .messages
    ];
    messages.add(message);
    final chat =
        super.state.chats.firstWhere((element) => element.id == chatId);
    final newChat = ChatModel(
      id: chat.id,
      fullName: chat.fullName,
      messages: messages,
    );
    final index = chats.indexWhere((element) => element.id == chatId);
    chats.removeWhere((element) => element.id == chatId);
    chats.insert(index, newChat);
    emit(
      ChatState(chats),
    );
  }
}
