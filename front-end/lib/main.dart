// main.dart
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'app.dart';

void main() => runApp(const Jobaile());
=======
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'BLoC/matchbloc/worker_bloc.dart';
import 'models/worker.dart';
import 'views/detailpage.dart';
import 'views/matchmaking.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Pencari ART',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: BlocProvider(
        create: (context) => WorkerBloc()..add(LoadNextWorkerEvent()), // Muat worker pertama saat aplikasi dimulai
        child: const WorkerDiscoveryPage(),
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/workerDetail') {
          final worker = settings.arguments as Worker;
          return MaterialPageRoute(
            builder: (context) => WorkerProfilePage(worker: worker),
          );
        }
        return null;
      },
    );
  }
}
>>>>>>> instant-match
