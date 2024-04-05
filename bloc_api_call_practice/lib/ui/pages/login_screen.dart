import 'package:bloc_api_call_practice/bloc/login_bloc.dart';
import 'package:bloc_api_call_practice/bloc/login_event.dart';
import 'package:bloc_api_call_practice/bloc/login_state.dart';
import 'package:bloc_api_call_practice/bloc/restaurant_bloc.dart';
import 'package:bloc_api_call_practice/data/repository/login_repository.dart';
import 'package:bloc_api_call_practice/data/repository/restaurant_repository.dart';
import 'package:bloc_api_call_practice/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              // Navigate to another screen upon successful login

              Navigator.push(context, MaterialPageRoute(builder: (context)=> BlocProvider(
                  create: (context) => RestaurantBloc(restaurantRepository: RestaurantRepository()),
                  child: HomePage())));

            } else if (state is LoginFailState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              loginBloc.add(
                SubmitLoginEvent(
                  username: emailController.text,
                  password: passwordController.text,
                ),
              );
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
