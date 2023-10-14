abstract class LoginEvent{

}
class LoginTextChangeEvent extends LoginEvent{
  final String email;
  final String password;

  LoginTextChangeEvent(this.email, this.password);
}
class LoginSubmittedChangeEvent extends LoginEvent{
  final String email;
  final String password;

  LoginSubmittedChangeEvent(this.email, this.password);
}
