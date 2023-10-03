import '../../data/models/chat_model.dart';
abstract class ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String gmail;
  final String password;
  final ChatModel message;

  SendMessageEvent({required this.gmail, required this.password, required this.message});
}

