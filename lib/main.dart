import 'package:flutter/material.dart';
import 'package:flutter_application_1/alercase_config.dart';
import 'package:flutter_application_1/chatcase_config.dart';
import 'package:flutter_application_1/usercase_config.dart';
import 'package:flutter_application_1/users/presentations/bloc/login/login_bloc.dart';
import 'package:flutter_application_1/users/presentations/bloc/registration/Registration_bloc.dart';
import 'package:flutter_application_1/users/presentations/bloc/userList/userList_bloc.dart';
import 'package:flutter_application_1/users/presentations/bloc/value/Registration_bloc.dart';
import 'package:flutter_application_1/users/presentations/pages/UserCredentials.dart';
import 'package:flutter_application_1/users/presentations/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'alerts/presentations/blocs/alert/alert_bloc.dart';
import 'chats/presentations/bloc/chat_bloc.dart';

ChatcaseConfig chatcaseConfig = ChatcaseConfig();
UsercaseConfig usercaseConfig = UsercaseConfig();
AlercaseConfig alercaseConfig = AlercaseConfig();

void main() {
  runApp(
    MultiProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(
              getUsersByOrderTypeUseCase: usercaseConfig.getUsersByOrderTypeUseCase
          ),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
              signInUseCase: usercaseConfig.signInUseCase
          ),
        ),
        BlocProvider<AlercaseBloc>(
          create: (context) => AlercaseBloc(
            setAlarmStatusUseCase: alercaseConfig.setAlarmStatusUseCase
          ),
        ),
        BlocProvider<RegistrationsBloc>(
          create: (context) => RegistrationsBloc(
              createUserUseCase: usercaseConfig.createUserUseCase
          ),
        ),
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(
              sendGroupChatMessageUseCase: chatcaseConfig.sendGroupChatMessageUseCase
          ),
        ),
        ChangeNotifierProvider<UserCredentials>(
          create: (context) => UserCredentials(),
        ),
        BlocProvider<RegistrationBloc>(
          create: (context) => RegistrationBloc(),
        ),
      ],
      child: MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}






