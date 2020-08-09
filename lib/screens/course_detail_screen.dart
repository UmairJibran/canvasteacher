import 'package:canvasteacher/data/courses.dart';
import 'package:canvasteacher/widgets/assignment_tile.dart';
import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  final String courseID;
  CourseDetailScreen({this.courseID});
  static const String route = "/courseDetail";
  @override
  Widget build(BuildContext context) {
    dynamic course =
        subjects.where((element) => element['id'] == courseID).toList();
    String courseName = course[0]['subjectName'];
    // String courseCode = course[0]['subjectCode'];
    Color courseColor = course[0]['color'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: courseColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Assigments"),
            Text(
              courseName,
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Labs and Assignments",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 17,
              ),
            ),
            AssignmentTile(
              color: courseColor,
            ),
          ],
        ),
      ),
    );
  }
}
