import 'package:flutter/material.dart';
import 'package:flutter_application_1/alerts/presentations/pages/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../alercase_config.dart';
import '../../../chats/presentations/pages/chat_page.dart';
import '../../../users/data/datasources/user_data_source.dart';
import '../../../users/presentations/bloc/userList/userLis_event.dart';
import '../../../users/presentations/bloc/userList/userList_bloc.dart';
import '../../../users/presentations/pages/UserCredentials.dart';
import '../../../users/presentations/pages/UserList_page.dart';
import '../../data/datasources/alert_data_source.dart';
import '../blocs/alert/alert_bloc.dart';
import '../blocs/alert/alert_event.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String orden = 'inorder';
    return Scaffold(
      appBar: AppBar(title: Text('Mi aplicación')),
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                CustomContainer(
                  icon: Icons.security,
                  title: 'Colonia',
                  iconColor: Colors.blue,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(width: 10),
                CustomContainer(
                  icon: Icons.location_on,
                  title: 'Tuxtla chiapas',
                  iconColor: Colors.red,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtonContainer(
                  icon: Icons.person_pin,
                  title: 'vecinos',
                  backgroundColor: Colors.white,
                  onPressed: () {
                    final userBloc = context.read<UserBloc>();
                   // userBloc.add(UserListStatusEvent(tipo: orden));

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ListaUsuarioScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(width: 10),
                CustomButtonContainer(
                  icon: Icons.local_hospital,
                  title: 'Emergencia',
                  backgroundColor: Colors.white,
                  onPressed: () {
                    // Manejar la acción de emergencia
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 370.0,
                  height: 320.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        child: BlocProvider(
                          create: (context) => AlercaseBloc(setAlarmStatusUseCase: null),
                          child: GestureDetector(
                            onTap: () async {
                              final alercaseBloc = BlocProvider.of<AlercaseBloc>(context);
                              final userCredentials = Provider.of<UserCredentials>(context, listen: false);
                              String email = userCredentials.email;
                              String password = userCredentials.password;

                              alercaseBloc.add(SetAlarmStatusEvent(email, password));
                              showDialog(
                                  context: context,
                                  builder: (buildcontext) {
                                    return AlertDialog(
                                      title: Text("alert"),
                                      content: Text("La alarma ha sido configurada."),
                                    );
                                  }
                              );
                            },
                            child: Container(
                              width: 160.0,
                              height: 160.0,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 0, 34),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 100,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 20,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 30),
                          child: Text(
                            'Send Emergency',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        child: Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ChatPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 20,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Chat',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
