import 'package:flutter/material.dart';
import 'package:flutter_application_1/users/presentations/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/users/presentations/pages/widgets/Login_widgets.dart';
import '../../../alerts/presentations/pages/alert_page.dart';
import '../../data/datasources/user_data_source.dart';
import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_event.dart';
import '../bloc/value/Registration_bloc.dart';
import '../bloc/value/Registration_event.dart';
import '../bloc/value/Registration_state.dart';
import 'UserCredentials.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildBackgroundImage(),
          buildLoginForm(context),
        ],
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildLogo(),
          SizedBox(height: 20.0),
          BlocBuilder<RegistrationBloc, RegistrationState>(
            builder: (context, state) {
              return TextField(
                controller: emailController,
                onChanged: (value) => BlocProvider.of<RegistrationBloc>(context).add(EmailChanged(value)),
                decoration: InputDecoration(
                  labelText: "Correo electrónico",
                  errorText: state is EmailError ? "No es un correo" : null,
                ),
              );
            },
          ),
          SizedBox(height: 10.0),
          BlocBuilder<RegistrationBloc, RegistrationState>(
            builder: (context, state) {
              return TextField(
                controller: passwordController,
                obscureText: true,
                onChanged: (value) => BlocProvider.of<RegistrationBloc>(context).add(PasswordChanged(value)),
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  errorText: state is PasswordError ? "No puede ir vacío" : null,
                ),
              );
            },
          ),
          SizedBox(height: 20.0),
          FractionallySizedBox(
              widthFactor: 0.8,
              child: BlocProvider(
                create: (context) => LoginBloc(signInUseCase: null ),
                child: BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      final userCredentials = Provider.of<UserCredentials>(context, listen: false);
                      userCredentials.updateCredentials(emailController.text, passwordController.text);
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => MyHomePage()));
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(SignIn(emailController.text, passwordController.text));
                      },
                      child: state is LoginLoading ? CircularProgressIndicator() : Text('Iniciar sesión'),
                    );
                  },
                ),
              )
          ),


          buildForgotPasswordButton(),
          buildRegisterButton(context),
        ],
      ),
    );
  }
}
