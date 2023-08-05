part of 'chat_cubit.dart';

class ChatState extends Equatable {
  const ChatState(
    this.chats,
  );
  final List<ChatModel> chats;
  @override
  List<Object> get props => [chats];
}
