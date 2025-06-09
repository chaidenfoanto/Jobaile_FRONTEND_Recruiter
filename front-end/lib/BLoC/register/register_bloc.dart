import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterSubmitted>((event, emit) async {
      emit(RegisterLoading());

      try {
        // Simulasi panggilan API atau validasi
        await Future.delayed(const Duration(seconds: 2));

        // Misalnya validasi sederhana
        if (event.email.isEmpty || !event.email.contains('@')) {
          emit(RegisterFailure('Email tidak valid'));
          return;
        }

        emit(RegisterSuccess());
      } catch (e) {
        emit(RegisterFailure('Registrasi gagal. Coba lagi.'));
      }
    });
  }
}
