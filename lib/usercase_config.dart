import 'package:flutter_application_1/users/data/datasources/user_data_source.dart';
import 'package:flutter_application_1/users/data/repositories/user_repository_impl.dart';
import 'package:flutter_application_1/users/domain/usecases/Registarse.dart';
import 'package:flutter_application_1/users/domain/usecases/listaCaseUser.dart';
import 'package:flutter_application_1/users/domain/usecases/login_usercase.dart';

class UsercaseConfig {
  UserLocalDataSourceImp? userLocalDataSourceImp;
  UserRepositoryImpl? userRepositoryImpl;
  GetUsersByOrderTypeUseCase? getUsersByOrderTypeUseCase;
  SignInUseCase? signInUseCase;
  CreateUserUseCase? createUserUseCase;

  UsercaseConfig() {
    userLocalDataSourceImp = UserLocalDataSourceImp();
    userRepositoryImpl = UserRepositoryImpl(userLocalDataSource: userLocalDataSourceImp!);
    getUsersByOrderTypeUseCase = GetUsersByOrderTypeUseCase(userRepositoryImpl!);
    signInUseCase = SignInUseCase(userRepositoryImpl!);
    createUserUseCase = CreateUserUseCase(userRepositoryImpl!);
  }
}
