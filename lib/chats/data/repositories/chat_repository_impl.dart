

import '../../domain/entities/chat.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_data_source.dart';
import '../models/chat_model.dart';

class ChatRepositoryImpl implements MessagingRepository {
   final ChatLocalDataSource chatLocalDataSource;

  ChatRepositoryImpl({required this.chatLocalDataSource});


  @override
  Future<ChatModel> send_group_chat_message(String gmail,String password,Message message) async{
    throw UnimplementedError();
  }


}