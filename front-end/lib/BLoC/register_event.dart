abstract class RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;
  final String gender;
  final String birthDate; // Format: YYYY-MM-DD
  final String idPhotoPath;

  RegisterSubmitted({
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.gender,
    required this.birthDate,
    required this.idPhotoPath,
  });
}
