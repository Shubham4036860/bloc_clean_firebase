abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginInvalidState extends LoginState {}

class LoginValidState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);
}

class LoginInLoadingState extends LoginState {}
