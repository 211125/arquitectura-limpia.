import 'package:flutter_bloc/flutter_bloc.dart';
import 'alert_event.dart';
import 'alert_state.dart';

import '../../../../alerts/domain/usecases/alercases.dart';

class AlercaseBloc extends Bloc<AlercaseEvent, AlercaseState> {
  final SetAlarmStatusUseCase? setAlarmStatusUseCase;

  AlercaseBloc({required this.setAlarmStatusUseCase}) : super(AlarmInitial());

  @override
  Stream<AlercaseState> mapEventToState(AlercaseEvent event) async* {
    if (event is SetAlarmStatusEvent) {
       await setAlarmStatusUseCase!.execute(event.email, event.password);
       yield AlarmSet();
    }
  }
}