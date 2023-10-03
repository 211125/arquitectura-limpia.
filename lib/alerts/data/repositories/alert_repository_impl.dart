import '../../domain/repositories/alert_repository.dart';
import '../datasources/alert_data_source.dart';


class AlerRepositoryImpl implements alertRepository {
  final AlertLocalDataSource alertLocalDataSource;

  AlerRepositoryImpl({required this.alertLocalDataSource});


  @override
  Future<void> set_alarm_status(email, password) async{
    return await alertLocalDataSource.set_alarm_status(email, password);

  }
}
