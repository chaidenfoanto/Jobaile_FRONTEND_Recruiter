// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:chat/BLoC/BLoC/chat_bloc.dart';
// import 'package:chat/views/chat.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Instant Match App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // Sediakan ChatBloc untuk ChatPage
//       home: BlocProvider(
//         create: (context) => ChatBloc(),
//         child: const ChatPage(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:chat/views/list_chat.dart'; // Path halaman daftar chat Anda

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instant Match App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Set ChatListPage sebagai home
      home: const ChatListPage(),
      // Atau jika Anda menggunakan named routes:
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const ChatListPage(),
      //   '/chatDetailNur': (context) => BlocProvider( // Contoh dengan BlocProvider
      //     create: (context) => ChatBloc(),
      //     child: const ChatPage(),
      //   ),
      //   // Tambahkan route untuk '/chatDetailKiran', '/chatDetailYuni' jika perlu
      //   // atau gunakan dynamic route untuk ChatPage
      // },
    );
  }
}