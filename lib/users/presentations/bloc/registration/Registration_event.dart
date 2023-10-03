import '../../../domain/entities/register.dart';

abstract class UserCreateEvent {}

class PostUser extends UserCreateEvent {
  final Register register;

  PostUser({required this.register});
}
