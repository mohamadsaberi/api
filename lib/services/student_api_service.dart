import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:projects/models/students.dart';

class StudentApiService {
  Future<List<Student>> fetchStudents() async {
    final response = await http.get(
        Uri.parse('https://freetestapi.com/api/v1/students/1'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List;
      return jsonData.map((studentJson) => Student.fromJson(studentJson))
          .toList();
    } else {
      throw Exception('Failed to load students');
    }
  }
}