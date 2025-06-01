import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';
import 'package:profile/models/user.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadProfile>((event, emit) async {
      await Future.delayed(Duration(seconds: 1)); // Simulasi loading

      // Data dummy user
      final user = User(
        name: 'Ariana Grande',
        email: 'ariana@example.com',
        phoneNumber: '+62 812 3456 7890',
      );

      emit(ProfileLoaded(user));
    });
  }
}
