import '../../data/models/getuser_model.dart';
import '../repositories/user_repository.dart';

class GetUsersByOrderTypeUseCase {
  final UserRepository userRepository;

  GetUsersByOrderTypeUseCase(this.userRepository);

  Future<List<UserModel>> execute(String orderType) async {
    try {
      return await userRepository.getUsers(orderType);

    } catch (e) {
      print('Error al obtener usuarios por tipo de orden: $e');
      throw e;
    }
  }
}
