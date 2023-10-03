import '../../data/models/chat_model.dart';

abstract class ChatState {}

class ChatInitialState extends ChatState {}

class ChatLoadingState extends ChatState {}

class ChatMessageSentState extends ChatState {}  // Asegúrate de añadir este estado

class ChatErrorState extends ChatState {
  final String error;

  ChatErrorState(this.error);
}
class ChatMessagesState extends ChatState {
  final List<ChatModel> messages;

  ChatMessagesState({required this.messages});

  ChatMessagesState.empty() : messages = const [];

  ChatMessagesState copyWith(List<ChatModel> newMessages) {
    return ChatMessagesState(messages: newMessages);
  }
}

