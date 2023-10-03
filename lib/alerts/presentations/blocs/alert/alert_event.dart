abstract class AlercaseEvent {}

class SetAlarmStatusEvent extends AlercaseEvent {
  final String email;
  final String password;

  SetAlarmStatusEvent(this.email, this.password);
}