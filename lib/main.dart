import 'package:flutter/material.dart';
import 'package:projects/repositories/student_repository.dart';
import 'package:projects/view_models/student_view_model.dart';
  import 'package:projects/views/home_page.dart';
import 'package:provider/provider.dart';

import 'services/student_api_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<StudentApiService>(
          create: (context) => StudentApiService(),
        ),
        Provider<StudentRepository>(
          create: (context) => StudentRepository(
            apiService: context.read<StudentApiService>(),
          ),
        ),ChangeNotifierProvider<StudentViewModel>(
          create: (context) => StudentViewModel(
            studentRepository: context.read<StudentRepository>(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
