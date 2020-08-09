import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  final String courseID;
  CourseDetailScreen({this.courseID});
  static const String route = "/courseDetail";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text("Course Detail Screen for $courseID"),
        ),
      ),
    );
  }
}
