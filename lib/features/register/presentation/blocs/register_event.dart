abstract class BusinessRegisterEvent {}

class BusinessRegisterTextChangeEvent extends BusinessRegisterEvent {
  String name;
  String email;
  String contact;
  String bType;
  String bGst;
  String bPassword;
  String confirmBPass;

  BusinessRegisterTextChangeEvent(this.name, this.email, this.contact, this.bType, this.bGst, this.bPassword, this.confirmBPass);
}

class BusinessRegisterSubmittedChangeEvent extends BusinessRegisterEvent {
  String name;
  String email;
  String contact;
  String bType;
  String bGst;
  String bPassword;
  String confirmBPass;

  BusinessRegisterSubmittedChangeEvent(this.name, this.email, this.contact, this.bType, this.bGst, this.bPassword, this.confirmBPass);
}
