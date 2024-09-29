import 'package:flutter/material.dart';
  import 'package:projects/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Api test',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
