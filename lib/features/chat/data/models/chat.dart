import 'package:expo_kg/features/chat/data/models/message.dart';

class ChatModel {
  final String id;
  final String fullName;
  final String? image;
  final List<MessageModel> messages;
  ChatModel({
    required this.id,
    required this.fullName,
    this.image,
    required this.messages,
  });
}
