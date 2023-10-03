
import '../entities/chat.dart';
import '../repositories/chat_repository.dart';

class SendGroupChatMessageUseCase {
  final MessagingRepository messagingRepository;

  SendGroupChatMessageUseCase(this.messagingRepository);

  Future<void> execute(String gmail, String password, Message message) async {
    try {
      await messagingRepository.send_group_chat_message(gmail, password, message);
      print("hola desde execute");
    } catch (e) {
      print('Error en SendGroupChatMessageUseCase: $e');
      throw Exception('Error al enviar el mensaje.');
    }
  }
}

