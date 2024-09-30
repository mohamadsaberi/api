import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/student_view_model.dart';class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Fetch students when the page is initialized
    Provider.of<StudentViewModel>(context, listen: false).fetchStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
      body: Consumer<StudentViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            // Display a loading indicator while fetching data
            return const Center(child: CircularProgressIndicator());
          } else if (viewModel.students.isEmpty) {
            // Display a message if no students are found
            return const Center(child: Text('No students found.'));
          }
          else {
            // Display the list of students
            return ListView.builder(
              itemCount: viewModel.students.length,
              itemBuilder: (context, index) {
                final student = viewModel.students[index];
                return ListTile(
                  title: Text(student.name),
                  subtitle: Text(student.email),
                );
              },
            );
          }
        },
      ),
    );
  }
}