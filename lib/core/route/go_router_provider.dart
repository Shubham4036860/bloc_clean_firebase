import 'package:bloc_with_clean/core/route/route_name.dart';
import 'package:bloc_with_clean/features/login/presentation/blocs/login_bloc.dart';
import 'package:bloc_with_clean/features/login/presentation/ui/login_view.dart';
import 'package:bloc_with_clean/features/network/presentation/ui/network_view.dart';
import 'package:bloc_with_clean/features/register/presentation/ui/register_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
   /* GoRoute(
      path: homeRoute,
      builder: (context, state) => NetworkView(nextScreen: BlocProvider(create: (context)=>LoginBloc(),child: LoginView(),)),
    ),*/
    GoRoute(
      path: loginView,
      builder: (context, state) =>  LoginView(),
    ), GoRoute(
      path: registerView,
      builder: (context, state) =>  RegisterView(),
    ),
  ],
);
