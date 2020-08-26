import 'package:canvasteacher/data/assignments.dart';
import 'package:canvasteacher/data/courses.dart';
import 'package:canvasteacher/models/assignment_model.dart';
import 'package:canvasteacher/widgets/assignment_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/course_model.dart';

class CourseDetailScreen extends StatefulWidget {
  final int courseID;
  CourseDetailScreen({this.courseID});
  static const String route = "/courseDetail";

  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  bool loaded = false;

  void getAssignments() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var querySnapshot = firebaseFirestore.collection("assignments").get();
    querySnapshot.then(
      (value) {
        final docs = value.docs;
        docs.forEach(
          (doc) {
            final assignment = doc.data();
            final dueDate =
                DateTime.parse(assignment['dueTime'].toDate().toString());
            assignments.add(
              Assignment(
                // id: assignment['id'],
                assignmentTitle: assignment['assignmentTitle'],
                dueTime: dueDate,
                needsGrading: assignment['needsGrading'],
                subjectId: assignment['subjectId'],
              ),
            );
          },
        );
      },
    ).then((_) {
      setState(() {
        loaded = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    assignments = [];
    getAssignments();
  }

  @override
  Widget build(BuildContext context) {
    List<Course> course =
        courses.where((element) => element.id == widget.courseID).toList();
    String courseName = course[0].subjectName;

    return loaded
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal[200],
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
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Labs and Assignments",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.38,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: assignments.length,
                      itemBuilder: (_, index) {
                        return AssignmentTile(
                          courseName,
                          color: Colors.teal[200],
                          assignmentTitle: assignments[index].assignmentTitle,
                          dueTime: assignments[index].dueTime,
                          needsGrading: assignments[index].needsGrading,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Field Trip Assignments",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.38,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: assignments.length,
                      itemBuilder: (_, index) {
                        return AssignmentTile(
                          courseName,
                          color: Colors.teal[200],
                          assignmentTitle: assignments[index].assignmentTitle,
                          dueTime: assignments[index].dueTime,
                          needsGrading: assignments[index].needsGrading,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
