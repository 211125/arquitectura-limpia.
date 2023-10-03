import '../entities/login.dart';
import '../repositories/user_repository.dart';

class SignInUseCase {
  final UserRepository userRepository;

  SignInUseCase(this.userRepository);

  Future<Login?> execute(String email, String password) async {
    try {
      final authUser = await userRepository.postLogin(email, password);
      return authUser;
    } catch (e) {

      return null;
    }
  }
}
