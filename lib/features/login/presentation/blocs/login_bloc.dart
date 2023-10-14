import 'package:bloc_with_clean/features/login/presentation/blocs/login_event.dart';
import 'package:bloc_with_clean/features/login/presentation/blocs/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginTextChangeEvent>((event, emit) => {
      if (event.email == "")
        {emit(LoginErrorState("Please Enter a valid Email address"))}
      else if (event.password == "")
        {emit(LoginErrorState("Please Enter a valid Password"))}
      else if (event.password.length < 3)
          {emit(LoginErrorState("Password Should be greater then 3"))}
        else
          {emit(LoginValidState())}
    });
    on<LoginSubmittedChangeEvent>((event, emit) => {emit(LoginInLoadingState())});
  }
}