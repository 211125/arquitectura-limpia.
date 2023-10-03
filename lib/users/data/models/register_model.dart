
import '../../domain/entities/register.dart';
import '../../domain/entities/user.dart';
class registerModel extends Register {
  registerModel({

    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
    required String state,
    required String city,
    required String calle,
    required String postal_code,
    required String interior_number,
  }) : super( name: name, email: email, password: password,phone: phone,address: address,state: state,city: city,calle: calle,postal_code: postal_code,interior_number: interior_number);


  factory registerModel.fromJson(Map<String, dynamic> json) {
    return registerModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      state:json['state'] ?? '',
      city: json['city'] ?? '',
      calle: json['calle'] ?? '',
      postal_code: json['postal_code'] ?? '',
      interior_number: json['interior_number'] ?? '',
    );
  }

  factory registerModel.fromEntity(Register register) {
    return registerModel(
      name: register.name,
      email: register.email,
      password: register.password,
      phone: register.phone,
      address: register.address,
      state: register.state,
      city: register.city,
      calle: register.calle,
      postal_code: register.calle,
      interior_number: register.interior_number,
    );
  }
}
