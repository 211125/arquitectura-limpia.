import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../users/presentations/pages/UserCredentials.dart';
import '../../data/models/chat_model.dart';
import '../bloc/chat_bloc.dart';
import '../bloc/chat_event.dart';
import '../bloc/chat_state.dart';


class ChatPage extends StatelessWidget {
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is ChatMessageSentState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Mensaje enviado!')),
            );
            messageController.clear();
          } else if (state is ChatErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: (state is ChatMessagesState) ? state.messages.length : 0,
                    itemBuilder: (context, index) {
                      if (state is ChatMessagesState) {
                        return ListTile(
                          title: Text(state.messages[index].message),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
                TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    labelText: 'Mensaje',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                state is ChatLoadingState
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () {
                    final userCredentials = Provider.of<UserCredentials>(context, listen: false);
                    String email = userCredentials.email;
                    String password = userCredentials.password;
                    context.read<ChatBloc>().add(
                      SendMessageEvent(
                        gmail: email,
                        password: password,
                        message: ChatModel(message: messageController.text),
                      ),
                    );
                  },
                  child: Text('Enviar Mensaje'),
                ),
              ],
            ),
          );
        },

      ),
    );
  }
}
