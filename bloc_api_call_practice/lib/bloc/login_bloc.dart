import 'package:bloc_api_call_practice/bloc/login_event.dart';
import 'package:bloc_api_call_practice/bloc/login_state.dart';
import 'package:bloc_api_call_practice/data/model/model_login_request.dart';
import 'package:bloc_api_call_practice/data/model/model_login_response.dart';
import 'package:bloc_api_call_practice/data/repository/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(LoginLoadingState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SubmitLoginEvent) {
      yield LoginLoadingState();
      try {
        final ModelLoginRequest loginRequest = ModelLoginRequest(username: event.username, password: event.password);
        final ModelLoginResponse response = await loginRepository.postLoginData(loginRequest);
        // handle successful response
        yield LoginSuccessState();
      } catch (e) {
        // handle error
        yield LoginFailState(message: 'Failed to login. Please try again.');
      }
    }
  }
}
