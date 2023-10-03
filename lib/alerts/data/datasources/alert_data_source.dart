import 'dart:convert';
import '../models/alert_model.dart';
import 'package:http/http.dart' as http;

abstract class AlertLocalDataSource {
  Future<void> set_alarm_status(String email, String password);
}

class AlertLocalDataSourceImp implements AlertLocalDataSource {
  @override
  Future<String> set_alarm_status(email, password) async {
    var url = Uri.parse('http://127.0.0.1:8000/alarma');
    var body = jsonEncode({'email': email, 'password': password});
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    if (response.statusCode == 200) {
      var alert = AlertModel.fromJson(jsonDecode(response.body));
      print('Respuesta del servidor: ${alert.message}');
      return alert.message;
    } else {
      print('Ha ocurrido un error al hacer la solicitud.');
      return 'Ha ocurrido un error al hacer la solicitud.';
    }
  }



}
