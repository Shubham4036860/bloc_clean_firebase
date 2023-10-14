import 'package:bloc_with_clean/features/register/presentation/blocs/register_event.dart';
import 'package:bloc_with_clean/features/register/presentation/blocs/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<BusinessRegisterEvent, BRegisterState> {
  RegisterBloc() : super(BRegisterInitialState()) {
    on<BusinessRegisterTextChangeEvent>((event, emit) => {
          if (event.name == "" || event.name == null || event.name.isEmpty)
            {emit(BRegisterErrorState("Please Enter Name"))}
          else if ((event.email == "" || event.email == null || event.email.isEmpty))
            {emit(BRegisterErrorState("Please Enter Email"))}
          else if (!isValidEmail(event.email))
            {emit(BRegisterErrorState("Please Enter Valid Email"))}
          else if (event.contact == "" || event.contact == null || event.contact.isEmpty)
            {emit(BRegisterErrorState("Please Enter Contact"))}
          else if (event.contact.length <= 10)
            {emit(BRegisterErrorState("Please Enter Valid Contact"))}
          else if (event.bType == "" || event.bType == null || event.bType.isEmpty)
            {emit(BRegisterErrorState("Please Enter Business Type"))}
          else if (event.bGst == "" || event.bGst == null || event.bGst.isEmpty)
            {emit(BRegisterErrorState("Please Enter Business GST No"))}
          else if (event.bPassword == "" || event.bPassword == null || event.bPassword.isEmpty)
            {emit(BRegisterErrorState("Please Enter Password"))}
          else if (event.bPassword.length < 3)
            {emit(BRegisterErrorState("Please Enter Password Should Be Grater Then 3"))}
          else if (event.confirmBPass == "" || event.confirmBPass == null || event.confirmBPass.isEmpty)
            {emit(BRegisterErrorState("Please Enter Confirm Password"))}
          else if (event.confirmBPass.length < 3)
            {emit(BRegisterErrorState("Please Enter Confirm Password Should Be Grater Then 3"))}
          else if (event.bPassword != event.confirmBPass)
            {emit(BRegisterErrorState("Password Should Be Same"))}
          else
            {emit(BRegisterValidState())}
        });
  }

  bool isValidEmail(String em) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(em);
  }
}
