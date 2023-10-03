import 'package:bloc/bloc.dart';
import '../../../data/models/getuser_model.dart';
import '../../../domain/usecases/listaCaseUser.dart';
import 'userLis_event.dart';
import 'userList_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersByOrderTypeUseCase? getUsersByOrderTypeUseCase;
  UserBloc({required this.getUsersByOrderTypeUseCase}) : super(UsersUnsorted());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is InOrderEvent) {
      List<UserModel>? users = await getUsersByOrderTypeUseCase?.execute("inorder");
      if (users != null && users.isNotEmpty) {
        yield UsersSortedInOrder(users);
      } else {
        yield UsersEmptyOrError();
      }
    } else if (event is PostOrderEvent) {
      List<UserModel>? users = await getUsersByOrderTypeUseCase?.execute("postorder");
      if (users != null && users.isNotEmpty) {
        yield UsersSortedInOrder(users);
      } else {
        yield UsersEmptyOrError();
      }
    } else if (event is PreOrderEvent) {
      List<UserModel>? users = await getUsersByOrderTypeUseCase?.execute("preorder");
      if (users != null && users.isNotEmpty) {
        yield UsersSortedInOrder(users);
      } else {
        yield UsersEmptyOrError();
      }
    }
  }

}