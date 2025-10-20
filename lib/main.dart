import 'package:flutter/material.dart';
import 'package:tasks/core/theme/app_theme.dart';
import 'package:tasks/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomePage(ownerName: "동훈"),
    );
  }
}
