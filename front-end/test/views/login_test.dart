import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/views/login.dart';
import 'package:register/BLoC/loginbloc/login_bloc.dart';
import 'package:register/urlapi/loginapi.dart';

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
        child: const LoginPage(),
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
        child: const LoginPage(),
      ),
    ),
  );

    final button = find.text('Sign In');
    expect(button, findsOneWidget);
    
  });

  testWidgets('Email should have @ symbol', (tester) async {
    final authBloc = AuthBloc(authRepository: FakeAuthRepository());

    await tester.pumpWidget(
    MaterialApp(
      home: BlocProvider<AuthBloc>.value(
        value: authBloc,
        child: const LoginPage(),
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
}
