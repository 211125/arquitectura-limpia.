import 'package:flutter_application_1/users/domain/entities/user.dart';

import '../../domain/entities/login.dart';
import '../../domain/entities/register.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_data_source.dart';
import '../models/getuser_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl({required this.userLocalDataSource});

  @override
  Future<Login?> login(String email, String password)async {
    return await userLocalDataSource.login(email, password);
  }

 




  @override
  Future<List<UserModel>> getUsers(String TipoDeOrden) async {
    return await userLocalDataSource.getUsers(TipoDeOrden);
  }

  @override
  Future<Login?> postLogin(String email, String password) async{
    return await userLocalDataSource.login(email, password);
  }

  @override
  Future<void> postUser(Register register) async{
    return await userLocalDataSource.postUser(register);

  }

}