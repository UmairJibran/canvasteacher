import 'package:canvasteacher/screens/course_detail_screen.dart';
import 'package:flutter/material.dart';
import './screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      routes: {
        "/": (ctx) => Home(),
        CourseDetailScreen.route: (ctx) => CourseDetailScreen(),
      },
    );
  }
}
