import 'package:collection/collection.dart';
import 'package:expo_kg/features/chat/data/datasources/messages.dart';
import 'package:expo_kg/features/chat/data/models/chat.dart';
import 'package:expo_kg/shared/configs/random.dart';
import 'package:expo_kg/shared/constants/names.dart';

final chatList = List.generate(
  random.nextInt(10),
  (index) => ChatModel(
    id: uuid.v1(),
    fullName: '${demoNames[random.nextInt(
      demoNames.length,
    )]} ${demoNames[random.nextInt(
      demoNames.length,
    )]}',
    messages: messagesList.sample(
      random.nextInt(
        messagesList.length,
      ),
    ),
  ),
);
