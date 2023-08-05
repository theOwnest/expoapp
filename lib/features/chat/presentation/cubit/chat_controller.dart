import 'package:expo_kg/features/chat/data/models/chat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatController extends Cubit<ChatModel> {
  ChatController(ChatModel chat) : super(chat);
}
