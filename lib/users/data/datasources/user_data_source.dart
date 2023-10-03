import 'dart:convert';

import 'package:flutter_application_1/users/domain/entities/login.dart';

import '../../domain/entities/register.dart';
import '../models/post_login.dart';
import '../models/getuser_model.dart';

import 'package:http/http.dart' as http;



abstract class UserLocalDataSource {
  Future<void> postUser(Register user);
  Future<List<UserModel>> getUsers(String TipoDeOrden);
  Future<Login?> login(String email, String password);

}

class UserLocalDataSourceImp implements UserLocalDataSource {
 


  @override
  Future<Login?> signIn(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Si el servidor devuelve una respuesta OK, parseamos el JSON.
      return UserLoginModel.fromJson(jsonDecode(response.body));
    } else {
      // Si la respuesta no es OK, lanzamos un error.
      throw Exception('Failed to load user');
    }
  }


  @override
  Future<List<UserModel>> getUsers(String tipoDeOrden) async {
    var url = Uri.parse('http://127.0.0.1:8000/users/$tipoDeOrden');
    print("URL: $url");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => UserModel.fromJson(item)).toList();
    } else {
      throw Exception('Error al obtener los usuarios');
    }
  }




  @override
  Future<Login?> login(String email, String password)async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Si el servidor devuelve una respuesta OK, parseamos el JSON.
      return UserLoginModel.fromJson(jsonDecode(response.body));
    } else {
      // Si la respuesta no es OK, lanzamos un error.
      print('Response body: ${response.body}');
      throw Exception('Failed to load user');
    }

  }

  @override
  Future<void> postUser(Register register)async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': register.name,
        'email': register.email,
        'password': register.password,
        'phone': register.phone,
        'address': register.address,
        'state': register.state,
        'city': register.city,
        'calle': register.calle,
        'postal_code': register.calle,
        'interior_number': register.interior_number,
      }),
    );

    if (response.statusCode == 200) {
      // Si el servidor devuelve una respuesta OK, parseamos el JSON.
      print("registro exitoso");
    } else {
      // Si la respuesta no es OK, lanzamos un error.
      print('Response body: ${response.body}');
      throw Exception('Failed to load user');
    }
  }

 




}