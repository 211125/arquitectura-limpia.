import '../../domain/entities/alert.dart';
class AlertModel extends Alert {
  AlertModel({
    required String message,
  }) : super(message);
  factory AlertModel.fromJson(Map<String, dynamic> json) {
    return AlertModel(
      message: json['message'],

    );
  }

  factory AlertModel.fromEntity(Alert Alert) {
    return AlertModel(
      message: Alert.message,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }

}