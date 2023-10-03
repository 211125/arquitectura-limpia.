import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/users/domain/usecases/login_usercase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final SignInUseCase? signInUseCase;

  LoginBloc({required this.signInUseCase}) : super(LoginInitial());
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SignIn) {
      yield LoginLoading();
      try {
       await signInUseCase?.execute(event.email, event.password);
       yield LoginSuccess();
      } catch (e) {
        yield LoginFailure(e.toString());
      }
    }
  }
}


