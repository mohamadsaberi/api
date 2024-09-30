import 'package:flutter/material.dart';
import 'package:projects/models/students.dart';
import '../repositories/student_repository.dart';

class StudentViewModel with ChangeNotifier {
  final StudentRepository studentRepository;
  List<Student> _students = [];
  bool _isLoading = false;

  StudentViewModel({required this.studentRepository});

  List<Student> get students => _students;

  bool get isLoading => _isLoading;

  Future<void> fetchStudents() async {
    _isLoading = true;
    notifyListeners();
    try {
      _students = await studentRepository.getStudents();
    } catch (e) {
      // Handle error
      print('Error fetching students: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}