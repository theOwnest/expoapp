import 'package:expo_kg/features/chat/data/models/message.dart';
import 'package:expo_kg/shared/configs/random.dart';

final messagesList = List.generate(
  random.nextInt(10),
  (index) => MessageModel(
    id: uuid.v1(),
    message:
        'Lorem ipsum dolor sit amet, consectetr adipiscing elit, sed diam nonummy',
    time: DateTime.now().subtract(
      Duration(
        minutes: random.nextInt(100),
      ),
    ),
    isMine: random.nextBool(),
  ),
);
