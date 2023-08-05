class MessageModel {
  final String id;
  final String message;
  final DateTime time;
  final bool isMine;
  MessageModel({
    required this.id,
    required this.message,
    required this.time,
    required this.isMine,
  });
}
