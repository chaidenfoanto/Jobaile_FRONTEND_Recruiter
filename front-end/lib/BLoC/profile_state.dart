import 'package:profile/models/user.dart';

// BLoC/profile_state.dart

// BLoC/profile_state.dart

abstract class ProfileState {}
class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileLoaded extends ProfileState {
  final User user;
  ProfileLoaded(this.user);
}
class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}