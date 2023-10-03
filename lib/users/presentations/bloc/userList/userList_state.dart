
// Estados
import '../../../data/models/getuser_model.dart';

abstract class UserState {}

class UsersUnsorted extends UserState {}

class UsersSortedInOrder extends UserState {
  final List<UserModel> users;
  UsersSortedInOrder(this.users);
}

class UsersEmptyOrError extends UserState {}
