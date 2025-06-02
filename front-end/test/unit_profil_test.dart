import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/BLoC/profile_bloc.dart';
import 'package:profile/BLoC/profile_event.dart';
import 'package:profile/BLoC/profile_state.dart';
import 'package:profile/models/user.dart';

/// Fungsi validasi nomor telepon dengan prefix +62 dan 6-15 digit angka
bool isValidPhone(String number) {
  // Regex untuk nomor telepon: dimulai dengan +62, diikuti spasi opsional,
  // lalu 6 hingga 15 digit angka.
  final regex = RegExp(r'^\+62\s?\d{6,15}$');
  return regex.hasMatch(number);
}

/// Fungsi validasi format email sederhana.
/// Memastikan email mengandung '@' dan setidaknya satu '.' setelah '@'.
bool isValidEmail(String email) {
  // Regex untuk validasi email dasar. Ini bisa diperluas untuk kasus yang lebih kompleks.
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  return emailRegex.hasMatch(email);
}

void main() {
  // Grup unit test untuk ProfileBloc
  group('ProfileBloc', () {
    // Test case untuk memastikan ProfileBloc memuat data profil dengan benar.
    blocTest<ProfileBloc, ProfileState>(
      'emits [ProfileInitial, ProfileLoaded] in order when LoadProfile is added and completes',
      build: () => ProfileBloc(), // Inisialisasi BLoC yang akan diuji
      act: (bloc) => bloc.add(LoadProfile()), // Aksi yang memicu perubahan state
      wait: const Duration(seconds: 1), // Menunggu durasi tertentu jika ada operasi async
      expect: () => [
        // Memastikan state awal adalah ProfileInitial
        isA<ProfileInitial>(),
        // Memastikan state berikutnya adalah ProfileLoaded
        isA<ProfileLoaded>().having(
          (state) => state.user, // Mengakses properti 'user' dari state
          'user',
          // Memastikan objek User memiliki data yang diharapkan
          isA<User>()
              .having((u) => u.name, 'name', 'Julia Harayu Wati')
              .having((u) => u.email, 'email', 'julia.harayuti01@gmail.com')
              .having((u) => u.phoneNumber, 'phoneNumber', '+62 385749464'),
        ),
      ],
    );

    // Anda bisa menambahkan test case lain untuk ProfileBloc di sini,
    // misalnya, jika ada event untuk mengedit profil, menyimpan data, dll.
  });

  // Grup unit test untuk validasi nomor telepon
  group('Phone Number Validation', () {
    test('returns true for valid phone number with +62 prefix and space', () {
      expect(isValidPhone('+62 385749464'), true);
    });

    test('returns true for valid phone number with +62 prefix without space', () {
      expect(isValidPhone('+62385749464'), true);
    });

    test('returns false for invalid phone number without +62 prefix', () {
      expect(isValidPhone('08123456789'), false);
    });

    test('returns false for empty phone number', () {
      expect(isValidPhone(''), false);
    });

    test('returns false for phone number with alphabetic characters', () {
      expect(isValidPhone('+62 abcdefg'), false);
    });

    test('returns false for phone number that is too short', () {
      expect(isValidPhone('+62 123'), false);
    });

    test('returns false for phone number that is too long', () {
      expect(isValidPhone('+62 12345678901234567'), false);
    });

    test('returns false for phone number with special characters', () {
      expect(isValidPhone('+62 385-749-464'), false);
    });
  });

  // Grup unit test baru untuk validasi email
  group('Email Validation', () {
    test('returns true for a valid email address', () {
      expect(isValidEmail('test@example.com'), true);
    });

    test('returns true for a valid email with subdomain', () {
      expect(isValidEmail('user@sub.domain.com'), true);
    });

    test('returns false for an email without @ symbol', () {
      expect(isValidEmail('testexample.com'), false);
    });

    test('returns false for an email without domain part', () {
      expect(isValidEmail('test@.com'), false);
    });

    test('returns false for an email without top-level domain', () {
      expect(isValidEmail('test@example'), false);
    });

    test('returns false for an empty email string', () {
      expect(isValidEmail(''), false);
    });

    test('returns false for an email with multiple @ symbols', () {
      expect(isValidEmail('test@example@com'), false);
    });

    test('returns false for an email starting with @', () {
      expect(isValidEmail('@example.com'), false);
    });
  });
}