import 'package:flutter/material.dart';
import 'package:inflack_limited_task2/Utils/colors.dart';
import 'package:inflack_limited_task2/View/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: AppColor.textFieldColor,
        ),
      ),
      home: HomePage(),
    );
  }
}