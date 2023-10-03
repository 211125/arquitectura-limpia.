import 'alerts/data/datasources/alert_data_source.dart';
import 'alerts/data/repositories/alert_repository_impl.dart';
import 'alerts/domain/usecases/alercases.dart';

class AlercaseConfig {
  AlertLocalDataSourceImp? alertLocalDataSourceImp;
  AlerRepositoryImpl? alertRepositoryImpl;
  SetAlarmStatusUseCase? setAlarmStatusUseCase;
  AlercaseConfig() {
    alertLocalDataSourceImp = AlertLocalDataSourceImp();
    alertRepositoryImpl = AlerRepositoryImpl(alertLocalDataSource: alertLocalDataSourceImp!);
    setAlarmStatusUseCase = SetAlarmStatusUseCase(alertRepositoryImpl!);
  }
}

