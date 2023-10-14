import 'dart:developer';

import 'package:bloc_with_clean/core/route/go_router_provider.dart';
import 'package:bloc_with_clean/features/login/presentation/blocs/login_bloc.dart';
import 'package:bloc_with_clean/features/register/presentation/blocs/register_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/network/presentation/blocs/network_cubit.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => InternetCubit(),
        ),
        BlocProvider<LoginBloc>(create: (BuildContext context) => LoginBloc()),
        BlocProvider<RegisterBloc>(create: (BuildContext context) => RegisterBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange: ${bloc.runtimeType}, ${bloc.state} \nCurrent state: ${change.currentState}\nNext state: ${change.nextState}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, ${bloc.state}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('onEvent(${bloc.state}, ${bloc.runtimeType}, $event)');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('onTransition(${bloc.state}, ${bloc.runtimeType}, ${transition.currentState}, ${transition.nextState})');
    super.onTransition(bloc, transition);
  }

  @override
  void onCreate(BlocBase bloc) {
    log('onCreate(${bloc.state}, ${bloc.runtimeType})');
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    log('onTransition(${bloc.state}, ${bloc.runtimeType})');
    super.onClose(bloc);
  }
}
