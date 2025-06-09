import 'package:equatable/equatable.dart';

class Recruiter extends Equatable {
  final String idRecruiter;
  final String fullName;
  final String houseType;
  final String age; // Ini dari 'umur' di API
  final String profilePicture;
  final int familySize;
  final String locationAddress; // Ini dari 'location_adddress' di API
  final String description; // Ini dari 'desc' di API
  final double ratingAverage;
  final int ratingCount;

  const Recruiter({
    required this.idRecruiter,
    required this.fullName,
    required this.houseType,
    required this.age,
    required this.profilePicture,
    required this.familySize,
    required this.locationAddress,
    required this.description,
    required this.ratingAverage,
    required this.ratingCount,
  });

  factory Recruiter.fromJson(Map<String, dynamic> json) {
    return Recruiter(
      idRecruiter: json['id_recruiter'].toString(),
      fullName: json['fullname'] as String,
      houseType: json['house_type'] as String,
      age: json['umur'].toString(), // Memetakan 'umur' dari API
      profilePicture: json['profile_picture'] as String,
      familySize: (json['family_size'] as num).toInt(),
      locationAddress: json['location_adddress'] as String, // Perhatikan 'location_adddress'
      description: json['desc'] as String, // Memetakan 'desc' dari API
      ratingAverage: (json['rating_average'] as num).toDouble(),
      ratingCount: (json['rating_count'] as num).toInt(),
    );
  }

  @override
  List<Object?> get props => [
        idRecruiter,
        fullName,
        houseType,
        age,
        profilePicture,
        familySize,
        locationAddress,
        description,
        ratingAverage,
        ratingCount,
      ];
}