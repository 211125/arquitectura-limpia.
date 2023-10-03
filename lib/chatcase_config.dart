import 'chats/data/datasources/chat_data_source.dart';
import 'chats/data/repositories/chat_repository_impl.dart';
import 'chats/domain/usecases/chat_cases.dart';

class ChatcaseConfig {
  ChatLocalDataSourceImp? chatLocalDataSourceImp;
  ChatRepositoryImpl? messagingRepositoryImpl;
  SendGroupChatMessageUseCase? sendGroupChatMessageUseCase;
  AlercaseConfig() {
    chatLocalDataSourceImp = ChatLocalDataSourceImp();
    messagingRepositoryImpl = ChatRepositoryImpl(chatLocalDataSource: chatLocalDataSourceImp!);
    sendGroupChatMessageUseCase = SendGroupChatMessageUseCase(messagingRepositoryImpl!);
  }
}

