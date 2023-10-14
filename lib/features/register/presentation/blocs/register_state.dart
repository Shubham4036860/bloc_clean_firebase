abstract class BRegisterState {}

class BRegisterInitialState extends BRegisterState {}

class BRegisterInvalidState extends BRegisterState {}

class BRegisterValidState extends BRegisterState {}

class BRegisterErrorState extends BRegisterState {
  final String errorMessage;

  BRegisterErrorState(this.errorMessage);
}

class BRegisterInLoadingState extends BRegisterState {}
