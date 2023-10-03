
import '../../domain/entities/login.dart';
import '../../domain/entities/user.dart';
class UserLoginModel extends Login {

  UserLoginModel({
    required String email,
    required String password,
  }) : super(email: email, password: password);


  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      // Asegúrate de usar los nombres correctos de las claves del JSON aquí
      email: json['email'] ?? '',
      password: json['password'] ?? '',

    );
  }

  factory UserLoginModel.fromEntity(Login login) {
    return UserLoginModel(
      email: login.email,
      password: login.password,
    );
  }
}
