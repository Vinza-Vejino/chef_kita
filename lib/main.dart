import 'package:flutter/material.dart';
import 'package:project_chef_kita/views/enterance.dart';
import 'package:project_chef_kita/views/home.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chef Kita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      home: HomeScreen(),
    );
  }
}
