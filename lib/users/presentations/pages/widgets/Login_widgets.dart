import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../alerts/presentations/pages/alert_page.dart';
import '../../../../usercase_config.dart';
import '../../../data/datasources/user_data_source.dart';
import '../../../domain/entities/login.dart';
import '../../bloc/login/login_bloc.dart';
import '../../bloc/login/login_event.dart';
import '../../bloc/login/login_state.dart';
import '../registration_page.dart';

UserLocalDataSource userLocalDataSource = UserLocalDataSourceImp();

Widget buildBackgroundImage() {
  return Positioned.fill(
    child: Transform.scale(
      scale: 1.2,
      child: Align(
        alignment: Alignment.topCenter,
        child: Image.asset(
          'assets/images/Rectangl.png',
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget buildLogo() {
  return Container(
    padding: EdgeInsets.only(top: 0.01),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            bottom: 5.0,
          ),
          child: Icon(
            Icons.security,
            size: 50.0,
            color: Color.fromARGB(255, 253, 253, 254),
          ),
        ),
        Text(
          'Colonia',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'segura',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    ),
  );
}

Widget buildEmailTextField(TextEditingController emailController) {
  return TextField(
    controller: emailController,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelText: 'Email',
      prefixIcon: Icon(Icons.email),
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
  );
}

Widget buildPasswordTextField(TextEditingController passwordController) {
  return TextField(
    controller: passwordController,
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Password',
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
  );
}



Widget buildForgotPasswordButton() {
  return TextButton(
    onPressed: () {},
    child: Text('¿Olvidaste tu contraseña?'),
  );
}

Widget buildRegisterButton(context) {
  return TextButton(
    onPressed: () {
      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RegistrationScreen(),
        //recoveryPass
      ),
    );},
    child: Text('Registrarse'),
  );
}

mixin context {
}
