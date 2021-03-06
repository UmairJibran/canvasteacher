import 'package:canvasteacher/screens/assignemnt_detail_screen.dart';
import 'package:canvasteacher/screens/course_detail_screen.dart';
import 'package:canvasteacher/screens/grade_screen.dart';
import 'package:canvasteacher/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      routes: {
        "/": (ctx) => LoginPage(),
        CourseDetailScreen.route: (ctx) => CourseDetailScreen(),
        AssignmentDetail.route: (ctx) => AssignmentDetail(),
        GradeScreen.route: (ctx) => GradeScreen(),
      },
    );
  }
}
