import 'package:bloc_with_clean/core/appfonts/app_fonts.dart';
import 'package:bloc_with_clean/core/route/route_name.dart';
import 'package:bloc_with_clean/core/theme/color_schemas.dart';
import 'package:bloc_with_clean/features/login/presentation/blocs/login_bloc.dart';
import 'package:bloc_with_clean/features/login/presentation/blocs/login_event.dart';
import 'package:bloc_with_clean/features/login/presentation/blocs/login_state.dart';
import 'package:bloc_with_clean/widgets/common_textformfield_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode? emailFocus;

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      backgroundColor: colorWhite,
      body: SingleChildScrollView(
          child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          } else if (state is LoginValidState) {}
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
              child: Image.asset(
                'assets/images/drawkit-transport-scene-8.png',
                height: 150,
                width: 150,
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 25),
              child: Text(
                'Please enter email id',
                style: CustomTextStyles.mediumText(color: primaryColor, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
              child: CommonTextFormField(
                editController: emailController,
                labelText: 'enter email',
                onChange: (val) {},
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                enableInputBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: primaryColor.withOpacity(0.35)),
                  //<-- SEE HERE
                  borderRadius: BorderRadius.circular(15.0),
                ),
                inputBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: primaryColor,
                  ),
                ),
                onValidate: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 25),
              child: Text(
                'Please enter Password',
                style: CustomTextStyles.mediumText(color: primaryColor, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
              child: CommonTextFormField(
                editController: passwordController,
                labelText: 'Password',
                onChange: (val) {},
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                enableInputBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: primaryColor.withOpacity(0.35)),
                  //<-- SEE HERE
                  borderRadius: BorderRadius.circular(15.0),
                ),
                inputBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: primaryColor,
                  ),
                ),
                onValidate: (val) {},
              ),
            ),
            InkWell(
              onTap: () {
                print("check on tap is wr");
                loginBloc.add(LoginTextChangeEvent(emailController.text, passwordController.text));

              },
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Center(
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: CustomTextStyles.textSemiBold(fontSize: 14, color: colorWhite),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "If you don`t have an account? ",
                        recognizer: TapGestureRecognizer()..onTap = () async {},
                        style: CustomTextStyles.mediumText(color: primaryColor, fontSize: 12),
                      ),
                      TextSpan(
                        text: "Sign In",
                        recognizer: TapGestureRecognizer()..onTap = () async {
                          GoRouter.of(context).push(registerView);
                        },
                        style: CustomTextStyles.textSemiBold(
                          color: primaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }


}
