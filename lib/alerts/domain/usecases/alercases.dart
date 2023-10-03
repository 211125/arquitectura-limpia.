
import '../../../users/domain/entities/user.dart';
import '../entities/alert.dart';
import '../repositories/alert_repository.dart';

class SetAlarmStatusUseCase {
  final alertRepository  aler_Repository;
  SetAlarmStatusUseCase(this.aler_Repository);

  Future<void> execute(String email, String password) async {
    try {
      await aler_Repository.set_alarm_status(email, password );
    } catch (e) {
//
    }
  }

  //set_alarm_status(String s, String t) {}
}
