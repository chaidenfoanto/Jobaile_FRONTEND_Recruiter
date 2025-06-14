import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:detail_profil/models/worker.dart';
import 'package:detail_profil/models/recruiter.dart'; // Import model Recruiter

class ProfileRepository { // Ganti nama kelas menjadi lebih umum
  final String _baseUrl = 'http://127.0.0.1:8000/api/detailprofileworker'; // Sesuaikan dengan rute Laravel

  final String _authToken = 'c3ndpJvG8Y50Hq9top8tnjrn0kzHn7BXRIuGBNoQ9d920c21';

  // Mengembalikan tipe data yang lebih umum, atau Map, atau Object
  // Jika Anda ingin mengembalikan objek spesifik, Anda mungkin perlu melewatkan
  // role pengguna saat ini dari frontend, atau membiarkan backend yang memutuskan.
  // Untuk kesederhanaan, kita bisa mengembalikan dynamic dan memprosesnya di UI
  Future<dynamic> getWoRecDetail(String idToFetch) async { // Ganti nama fungsi
    final url = '$_baseUrl/$idToFetch';

    print('Request URL: $url');
    print('Auth Token: $_authToken');

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $_authToken',
        },
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          final Map<String, dynamic> data = responseData['data'];
          // Deteksi apakah data adalah Worker atau Recruiter berdasarkan kunci unik
          if (data.containsKey('id_worker')) {
            return Worker.fromJson(data);
          } else if (data.containsKey('id_recruiter')) {
            return Recruiter.fromJson(data);
          } else {
            throw Exception('Unknown profile type received from API.');
          }
        } else {
          String errorMessage = 'Failed to load profile detail: Unknown status error';
          if (responseData['message'] != null) {
            errorMessage = responseData['message'];
          } else if (responseData['messagee'] != null) { // Handle potential typo 'messagee'
            errorMessage = responseData['messagee'];
          }
          throw Exception(errorMessage);
        }
      } else {
        String errorMessage = 'HTTP Error ${response.statusCode}: Failed to connect to server';
        if (responseData['message'] != null) {
          errorMessage += ' - ${responseData['message']}';
        } else if (responseData['error'] != null) {
          errorMessage += ' - ${responseData['error']}';
        }
        throw Exception(errorMessage);
      }
    } catch (e) {
      print('Error during HTTP request: $e');
      throw Exception('Network error or invalid response: ${e.toString()}');
    }
  }
}