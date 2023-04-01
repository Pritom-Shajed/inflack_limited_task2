import 'package:flutter/material.dart';
import 'package:inflack_limited_task2/Utils/colors.dart';
import 'package:inflack_limited_task2/view/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task 2',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: AppColor.textFieldColor,
        ),
      ),
      home: const HomePage(),
    );
  }
}