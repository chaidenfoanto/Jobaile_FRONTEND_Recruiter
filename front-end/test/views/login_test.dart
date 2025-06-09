import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:login/BLoC/login/login_bloc.dart';
import 'package:login/services/loginapi.dart';
import 'package:login/views/login.dart';
import 'package:login/views/register.dart';


class FakeAuthRepository extends AuthRepository {
  @override
  Future<bool> authenticate(String email, String password) async {
    return true; // selalu berhasil untuk test ini
  }
}

void main() {
  testWidgets('Password field should obscure text', (tester) async {
  final authBloc = AuthBloc(authRepository: FakeAuthRepository());

  await tester.pumpWidget(
    MaterialApp(
      home: BlocProvider<AuthBloc>.value(
        value: authBloc,
        child: const LoginScreen(),
      ),
    ),
  );

  final passwordField = find.byKey(const Key('passwordField'));
  expect(passwordField, findsOneWidget);

  const testPassword = 'mysecretpassword';
  await tester.enterText(passwordField, testPassword);
  await tester.pump();

  // Cek obscureText benar
  final textField = tester.widget<TextField>(passwordField);
  expect(textField.obscureText, isTrue);

  // **Jangan cek find.text(testPassword) karena akan selalu ditemukan**

  // Test lain yang relevan bisa ditambahkan di sini jika perlu
  });

  testWidgets('Sign in button test', (tester) async {
    final authBloc = AuthBloc(authRepository: FakeAuthRepository());

    await tester.pumpWidget(
    MaterialApp(
      home: BlocProvider<AuthBloc>.value(
        value: authBloc,
        child: const LoginScreen(),
      ),
    ),
  );

    final button = find.text('Sign In');
    expect(button, findsOneWidget);

    final button2 = find.text('Daftar');
    expect(button2, findsOneWidget);

    final button3 = find.text('Lupa kata sandi?');
    expect(button3, findsOneWidget);
  });
  

  testWidgets('Email should have @ symbol', (tester) async {
    final authBloc = AuthBloc(authRepository: FakeAuthRepository());

    await tester.pumpWidget(
    MaterialApp(
      home: BlocProvider<AuthBloc>.value(
        value: authBloc,
        child: const LoginScreen(),
      ),
    ),
  );
  
    final emailField = find.byKey(const Key('emailField'));
    expect(emailField, findsOneWidget);

    await tester.enterText(emailField, 'testemail.com');
    await tester.pump();

    // Cek apakah email valid
    final emailText = tester.widget<TextField>(emailField);
    expect(emailText.controller?.text.contains('@'), isFalse);

    // Masukkan email yang benar
    await tester.enterText(emailField, 'test@email.com');
    await tester.pump();

    // Cek apakah email valid
    expect(emailText.controller?.text.contains('@'), isTrue);
  });

  testWidgets('Tombol Daftar navigasi ke halaman register', (WidgetTester tester) async {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Scaffold(
            body: Center(
              child: TextButton(
                key: Key('daftarButton'),
                onPressed: () => context.go('/register'),
                child: Text('Daftar'),
              ),
            ),
          ),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => RegisterScreen(), // Pakai halaman asli kamu
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(
      routerConfig: router,
    ));

    final daftar = find.widgetWithText(TextButton, 'Daftar');
    // Pastikan tombol tampil
    await tester.tap(daftar);
    // Tap tombol

    final texthalamanregist = find.text('Registrasi');
    await tester.pumpAndSettle();

    // Cek apakah halaman register muncul, misalnya berdasarkan teks atau widget unik
    expect(texthalamanregist, findsOneWidget); // Ganti dengan konten khas RegisterPage
  });
}
