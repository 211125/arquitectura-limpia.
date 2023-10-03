import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/chat.dart';
import '../../domain/repositories/chat_repository.dart';
import '../models/chat_model.dart';




abstract class ChatLocalDataSource {
  Future<ChatModel> send_group_chat_message(String gmail,String password,Message message);

}
class ChatLocalDataSourceImp implements ChatLocalDataSource {
  @override
  Future<ChatModel> send_group_chat_message(String gmail,String password,Message message)async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/chat/message'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user': {
          'email': gmail,
          'password': password,
        },
        'message': {
          'message': message.message,
        },
      }),
    );

    if (response.statusCode == 200) {
      return ChatModel.fromJson(jsonDecode(response.body));
    } else {
      print("error");
      throw Exception('Failed to send message.');
    }
  }
}