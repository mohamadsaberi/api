import 'package:projects/models/students.dart';
import '../services/student_api_service.dart';

class StudentRepository {
  final StudentApiService apiService;

  StudentRepository({required this.apiService});

  Future<List<Student>> getStudents() async {
    return await apiService.fetchStudents();
  }
}