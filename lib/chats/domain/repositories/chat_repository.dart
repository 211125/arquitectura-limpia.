

import '../entities/chat.dart';

abstract class MessagingRepository {
  Future<void> send_group_chat_message(String gmail,String password,Message messagege);



}
