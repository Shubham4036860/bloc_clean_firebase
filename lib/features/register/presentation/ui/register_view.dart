import 'package:bloc_with_clean/core/appfonts/app_fonts.dart';
import 'package:bloc_with_clean/core/route/route_name.dart';
import 'package:bloc_with_clean/core/theme/color_schemas.dart';
import 'package:bloc_with_clean/features/register/presentation/blocs/register_bloc.dart';
import 'package:bloc_with_clean/features/register/presentation/blocs/register_event.dart';
import 'package:bloc_with_clean/features/register/presentation/blocs/register_state.dart';
import 'package:bloc_with_clean/widgets/common_textformfield_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatefulWidget {


  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController businessEmailController = TextEditingController();
  TextEditingController businessGSTNumberController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController businessTypeController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registerBloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
      backgroundColor: colorWhite,
      body: SafeArea(
        bottom: true,
        top: true,
        child: SingleChildScrollView(
          child: BlocListener<RegisterBloc, BRegisterState>(
            listener: (context, state) {
              if (state is BRegisterErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: colorRed,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              } else if (state is BRegisterValidState) {}
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12, left: 25),
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: colorWhite,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                    child: Image.asset(
                      'assets/images/drawkit-transport-scene-1.png',
                      height: 150,
                      width: 150,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 25),
                  child: Text(
                    'Please enter your business name',
                    style: CustomTextStyles.mediumText(color: primaryColor, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
                  child: CommonTextFormField(
                    editController: businessNameController,
                    labelText: 'Business Name',
                    onChange: (val) {},
                    textInputType: TextInputType.text,
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
                    onValidate: (val) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 25),
                  child: Text(
                    'Please enter business email',
                    style: CustomTextStyles.mediumText(color: primaryColor, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
                  child: CommonTextFormField(
                    editController: businessEmailController,
                    labelText: 'Business email',
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
                    onValidate: (val) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 25),
                  child: Text(
                    'Please enter business contact',
                    style: CustomTextStyles.mediumText(color: primaryColor, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
                  child: CommonTextFormField(
                    editController: contactNumberController,
                    labelText: 'Business contact',
                    onChange: (val) {},
                    textInputType: TextInputType.number,
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
                    onValidate: (val) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 25),
                  child: Text(
                    'Please enter business type',
                    style: CustomTextStyles.mediumText(color: primaryColor, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
                  child: CommonTextFormField(
                    editController: businessTypeController,
                    labelText: 'Business Type',
                    onChange: (val) {},
                    textInputType: TextInputType.text,
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
                    onValidate: (val) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 25),
                  child: Text(
                    'Please enter business GST No',
                    style: CustomTextStyles.mediumText(color: primaryColor, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
                  child: CommonTextFormField(
                    editController: businessGSTNumberController,
                    labelText: 'Business GST No',
                    onChange: (val) {},
                    textInputType: TextInputType.text,
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
                    onValidate: (val) {},
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
                    textInputType: TextInputType.emailAddress,
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
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 25),
                  child: Text(
                    'Please enter Confirm Password',
                    style: CustomTextStyles.mediumText(color: primaryColor, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
                  child: CommonTextFormField(
                    editController: cPasswordController,
                    labelText: 'Confirm Password',
                    onChange: (val) {},
                    textInputType: TextInputType.visiblePassword,
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
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: InkWell(
                    onTap: () {
                      registerBloc.add(BusinessRegisterTextChangeEvent(
                        businessNameController.text,
                        businessEmailController.text,
                        contactNumberController.text,
                        businessTypeController.text,
                        businessGSTNumberController.text,
                        passwordController.text,
                        cPasswordController.text,));
                    },
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
                            'Sign In',
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
                            text: "If you have an already account? ",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {},
                            style: CustomTextStyles.mediumText(color: primaryColor, fontSize: 12),
                          ),
                          TextSpan(
                            text: "Sign up",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                GoRouter.of(context).replace(loginView);
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
