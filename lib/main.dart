import 'package:flutter/material.dart';

void main() {
  runApp(MyResumeBuilderApp());
}

class MyResumeBuilderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume Builder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}


