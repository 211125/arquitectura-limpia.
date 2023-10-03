import '../../domain/entities/user.dart';
class UserModel extends User {

  UserModel({
    required String id,
    required String email,
    required String name
  }) : super(id: id, email: email, name: name );

  factory UserModel.fromJson(List<dynamic> json) {
    return UserModel(
      id: json[0].toString(),
      name: json[1],
      email: json[2],
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
    );
  }
}
