class ChatMessage {
  final String message;
  final bool isUser;
  final DateTime createdAt;

  ChatMessage({
    required this.message,
    required this.isUser,
    required this.createdAt,
  });
}