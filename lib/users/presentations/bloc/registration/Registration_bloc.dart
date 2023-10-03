import 'package:bloc/bloc.dart';
import '../../../domain/usecases/Registarse.dart';
import 'Registration_event.dart';
import 'Registration_state.dart';

class RegistrationsBloc extends Bloc<UserCreateEvent, UserCreateState> {
  final CreateUserUseCase? createUserUseCase;

  RegistrationsBloc({required this.createUserUseCase}) : super(UserInitial());

  @override
  Stream<UserCreateState> mapEventToState(UserCreateEvent event) async* {
    if (event is PostUser) {
      yield UserLoading();
      try {
        await createUserUseCase?.execute(event.register);
        yield UserPosted();
      } catch (_) {
        yield UserError();
      }
    }
  }
}
