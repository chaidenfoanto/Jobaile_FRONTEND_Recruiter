import 'package:equatable/equatable.dart';

class Worker extends Equatable {
  final String idWorker;
  final String fullName;
  final String bio;
  final String age;
  final String profilePicture;
  final List<String> skills; // Akan tetap ada di model tapi tidak ditampilkan di UI
  final int experienceYears; // Akan kita gunakan untuk mem-format teks pengalaman
  final String location;
  final int expectedSalary;
  final String availability;

  const Worker({
    required this.idWorker,
    required this.fullName,
    required this.bio,
    required this.age,
    required this.profilePicture,
    required this.skills,
    required this.experienceYears,
    required this.location,
    required this.expectedSalary,
    required this.availability,
  });

  factory Worker.fromJson(Map<String, dynamic> json) {
    List<String> parsedSkills = [];
    if (json['skill'] != null && json['skill'] is String) {
      parsedSkills = (json['skill'] as String)
          .split(',')
          .map((s) => s.trim())
          .where((s) => s.isNotEmpty)
          .toList();
    }

    return Worker(
      idWorker: json['id_worker'].toString(),
      fullName: json['fullname'] as String,
      bio: json['bio'] as String,
      age: json['umur'].toString(),
      profilePicture: json['profile_picture'] as String,
      skills: parsedSkills,
      experienceYears: (json['experience_years'] as num).toInt(),
      location: json['location'] as String,
      expectedSalary: (json['expected_salary'] as num).toInt(),
      availability: json['availability'] as String,
    );
  }

  @override
  List<Object?> get props => [
        idWorker,
        fullName,
        bio,
        age,
        profilePicture,
        skills,
        experienceYears,
        location,
        expectedSalary,
        availability,
      ];
}