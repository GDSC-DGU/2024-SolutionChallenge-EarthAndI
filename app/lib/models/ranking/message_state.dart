class MessageState {
  final String id;
  final String nickname;
  final String thumbnailPath;
  final String message;

  const MessageState({
    required this.id,
    required this.nickname,
    required this.thumbnailPath,
    this.message = "",
  });

  MessageState copyWith({
    String? id,
    String? nickname,
    String? thumbnailPath,
    String? message,
  }) {
    return MessageState(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      message: message ?? this.message,
    );
  }

  factory MessageState.empty() {
    return const MessageState(
      id: "",
      nickname: "",
      thumbnailPath: "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nickname': nickname,
      'message': message,
    };
  }

  @override
  String toString() {
    return 'MessageState(id: $id, nickname: $nickname, thumbnailPath: $thumbnailPath, message: $message)';
  }
}
