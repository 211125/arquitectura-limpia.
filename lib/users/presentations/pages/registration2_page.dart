import 'package:flutter/material.dart';
import 'package:flutter_application_1/users/presentations/pages/registerCredential.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/register.dart';
import '../bloc/registration/Registration_bloc.dart';
import '../bloc/registration/Registration_event.dart';
import 'login_page.dart';

class recoveryPass extends StatefulWidget {
  @override
  _recoveryPass createState() => _recoveryPass();
}

class _recoveryPass extends State<recoveryPass> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController calleController = TextEditingController();
  final TextEditingController internumberController = TextEditingController();

  bool isEmailValid = true;
  bool isAddressValid = true;
  bool isPostalCodeValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
              child: Transform.scale(
                scale: 1.2,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'asset/images/Rectangl.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: 10.0),
                  TextField(
                    controller: addressController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'address',
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),

                  SizedBox(height: 10.0),
                  TextField(
                    controller: stateController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'state',
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: cityController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'city',
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: calleController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'calle',
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: postalCodeController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'postal_code',
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: internumberController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'interior_number',
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {

                      final userCredentials = Provider.of<registerCredential>(context, listen: false);
                      String email = userCredentials.email;
                      String password = userCredentials.password;
                      String name = userCredentials.name;
                      String phone=userCredentials.phone;
                      final register = Register(
                            name:name,
                          email: email,
                          password:password,
                          phone:phone,
                          address: addressController.text,
                          state: stateController.text,
                          city: cityController.text,
                          calle: calleController.text,
                          postal_code: postalCodeController.text,
                          interior_number:internumberController.text,

                        );

                        BlocProvider.of<RegistrationsBloc>(context).add(PostUser(register: register));


                    },

                      child: Text('enviar'),
                  ),
                  SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text('Log In'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
