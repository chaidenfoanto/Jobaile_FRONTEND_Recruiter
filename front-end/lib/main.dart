import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:detail_profil/repository/detail_repository.dart';
import 'package:detail_profil/BLoC/detail_bloc.dart';
import 'package:detail_profil/views/pages/detail_worker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Worker Detail App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => WorkerDetailBloc(
          workerRepository: ProfileRepository(),
        )..add(const LoadWorkerDetail('wViHhN3kKOVLboYhimfG')), // Ganti dengan ID worker valid dari database Anda
        child: const WorkerDetailPage(workerId: 'wViHhN3kKOVLboYhimfG'), // Ganti dengan ID worker valid dari database Anda
      ),
    );
  }
}