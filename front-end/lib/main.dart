import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/BLoC/loginbloc/login_bloc.dart';

import 'package:register/route/go-route-list.dart';
import 'package:register/urlapi/loginapi.dart';

void main() {
  final authRepository = AuthRepository(); // Misalnya kamu punya repo untuk auth

  runApp(MyApp(authRepository: authRepository));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;

  const MyApp({Key? key, required this.authRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(authRepository: authRepository),
        ),
        // Tambahkan bloc lain di sini
        // BlocProvider<ProfileBloc>(
        //   create: (_) => ProfileBloc(profileRepository: ...),
        // ),
        // BlocProvider<HomeBloc>(
        //   create: (_) => HomeBloc(homeRepository: ...),
        // ),
      ],
      child: MaterialApp.router(
        title: 'Jobaile',
        debugShowCheckedModeBanner: false,
        routerConfig: rutepage,
      ),
    );
  }
}