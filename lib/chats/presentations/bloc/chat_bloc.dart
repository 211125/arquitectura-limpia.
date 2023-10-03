import 'package:bloc/bloc.dart';
import '../../domain/entities/chat.dart';
import '../../domain/usecases/chat_cases.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendGroupChatMessageUseCase? sendGroupChatMessageUseCase;

  ChatBloc({required this.sendGroupChatMessageUseCase}) : super(ChatInitialState());

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    print("Evento recibido en ChatBloc: $event");


    if (event is SendMessageEvent) {
      yield ChatLoadingState();
      try {
        await sendGroupChatMessageUseCase?.execute(
          event.gmail,
          event.password,
          event.message,
        );

        if (state is ChatMessagesState) {
          final currentMessages = (state as ChatMessagesState).messages;
          yield (state as ChatMessagesState).copyWith([...currentMessages, event.message]);
        } else {
          yield ChatMessagesState(messages: [event.message]);
        }
      } catch (e) {
        yield ChatErrorState('Failed to send message: $e');
      }
    }


  }
}
