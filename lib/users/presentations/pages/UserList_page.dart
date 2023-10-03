import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/userList/userLis_event.dart';
import '../bloc/userList/userList_bloc.dart';
import '../bloc/userList/userList_state.dart';

class ListaUsuarioScreen extends StatefulWidget {
  @override
  _ListaUsuarioScreenState createState() => _ListaUsuarioScreenState();
}

class _ListaUsuarioScreenState extends State<ListaUsuarioScreen> {
  UserBloc? _userBloc;

  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Usuarios"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            onPressed: () => _userBloc?.add(InOrderEvent()),
            tooltip: "Ordenar InOrder",
          ),
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () => _userBloc?.add(PreOrderEvent()),
            tooltip: "Ordenar PreOrder",
          ),
          IconButton(
            icon: Icon(Icons.sort_rounded),
            onPressed: () => _userBloc?.add(PostOrderEvent()),
            tooltip: "Ordenar PostOrder",
          ),
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UsersUnsorted) {
            return Center(child: Text("Usuarios sin ordenar"));
          } else if (state is UsersSortedInOrder) {
            return ListView.separated(
              itemCount: state.users.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/perfil.jpg'),
                    ),
                    title: Text(state.users[index].name),
                  ),
                );
              },
            );
          } else if (state is UsersEmptyOrError) {
            return Center(child: Text("Error o lista de usuarios vacía"));
          }
          return CircularProgressIndicator(); // Mostrar un loader por defecto en caso de que no coincida con ningún estado
        },
      ),
    );
  }
}
