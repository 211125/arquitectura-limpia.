abstract class LoginEvent {}

class SignIn extends LoginEvent {
  final String email;
  final String password;

  SignIn(this.email, this.password);
}