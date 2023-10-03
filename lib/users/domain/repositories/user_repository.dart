
import '../../data/models/getuser_model.dart';
import '../entities/login.dart';
import '../entities/register.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<void> postUser(Register register);
 // Future<void> login(String email,String password);
  Future<List<UserModel>> getUsers(String TipoDeOrden);  // Modifica el tipo de retorno aquí
  Future<Login?> postLogin(String email, String password);

}