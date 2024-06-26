import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SubmitLoginEvent extends LoginEvent {
  final String username;
  final String password;

  SubmitLoginEvent({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}
