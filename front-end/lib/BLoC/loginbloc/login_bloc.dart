// login_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/repository/auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class AuthBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      final success = await authRepository.authenticate(event.email, event.password);
      
      if (success) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(message: 'Invalid credentials'));
      }
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}