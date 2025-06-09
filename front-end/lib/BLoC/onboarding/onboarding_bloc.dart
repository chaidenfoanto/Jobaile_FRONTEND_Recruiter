import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState(currentPage: 0)) {
    on<PageChanged>((event, emit) {
      emit(state.copyWith(currentPage: event.page));
    });

    on<SkipPressed>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isFirstLaunch', false);
    });

    on<EnableLocationPressed>(_handleLocationPermission);
  }

  Future<void> _handleLocationPermission(
      EnableLocationPressed event, Emitter<OnboardingState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        emit(state.copyWith(isLoading: false));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(state.copyWith(isLoading: false));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(state.copyWith(isLoading: false));
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final prefs = await SharedPreferences.getInstance();
      prefs.setDouble('latitude', position.latitude);
      prefs.setDouble('longitude', position.longitude);
      prefs.setBool('isFirstLaunch', false);

      emit(state.copyWith(isLoading: false));

      // 🟢 Navigasi setelah berhasil
      event.onSuccessNavigate?.call();

    } catch (_) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
