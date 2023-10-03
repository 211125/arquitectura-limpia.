abstract class RegistrationEvent {}
class EmailChanged extends RegistrationEvent {
  final String email;
  EmailChanged(this.email);
}
class PasswordChanged extends RegistrationEvent {
  final String password;
  PasswordChanged(this.password);
}