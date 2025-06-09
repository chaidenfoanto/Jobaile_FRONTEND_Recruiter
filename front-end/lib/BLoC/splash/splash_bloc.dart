import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_event.dart';
import 'splash_state.dart';
import '../../repository/splash_repository.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashRepository repository;

  SplashBloc({required this.repository}) : super(SplashInitial()) {
    on<StartSplashEvent>(_onStartSplash);
  }

  Future<void> _onStartSplash(
      StartSplashEvent event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(seconds: 1)); // total durasi animasi
    final isFirst = await repository.isFirstLaunch();

    if (isFirst) {
      await repository.setFirstLaunchFalse();
      emit(SplashToOnboarding());
    } else {
      emit(SplashToLogin());
    }
  }
}
