import '../models/chat.dart';

List<ChatModel> searchChat(String query, List<ChatModel> allChats) {
  List<ChatModel> chats = [];
  chats.addAll(
    allChats.where(
      (element) => element.fullName.toLowerCase().contains(
            query.toLowerCase(),
          ),
    ),
  );
  return chats;
}
