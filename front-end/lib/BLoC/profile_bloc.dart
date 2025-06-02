import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';
import 'package:profile/models/user.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
  on<LoadProfile>((event, emit) async {
    emit(ProfileInitial()); // Tambahkan ini agar state pertama jelas
    await Future.delayed(Duration(seconds: 1)); // Simulasi loading

    final user = User(
      name: 'Julia Harayu Wati',
      email: 'julia.harayuti01@gmail.com',
      phoneNumber: '+62 385749464',
    );

    emit(ProfileLoaded(user));
  });
}

}
