

import '../../domain/entities/chat.dart';


class ChatModel extends Message {
  ChatModel({
    required String message,
  }) : super( message);

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      message: json['message'],
    );
  }

  factory ChatModel.fromEntity(Message Message) {
    return ChatModel(
        message: Message.message,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': message,
    };
  }

}