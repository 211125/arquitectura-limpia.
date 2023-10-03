import '../entities/register.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class CreateUserUseCase {
  final UserRepository userRepository;
  CreateUserUseCase(this.userRepository);
  Future<void> execute(Register register) async {
    try {
      await userRepository.postUser(register);
    } catch (e) {
      print('Error al crear el usuario: $e');
      throw e;
    }
  }
}
