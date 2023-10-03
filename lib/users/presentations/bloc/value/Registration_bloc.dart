import 'package:bloc/bloc.dart';
import './Registration_event.dart';
import 'Registration_state.dart';
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(LoginInitial());

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is EmailChanged) {
      if (!isEmailValid(event.email)) {
        yield EmailError();
      } else {
        yield LoginInitial();
      }
    } else if (event is PasswordChanged) {
      if (event.password.isEmpty) {
        yield PasswordError();
      } else {
        yield LoginInitial();
      }
    }
  }

  bool isEmailValid(String email) {
    return email.contains('@');
  }
}
