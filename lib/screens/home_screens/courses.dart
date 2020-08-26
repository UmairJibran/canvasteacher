import 'package:canvasteacher/models/course_model.dart';
import 'package:canvasteacher/screens/adding_assignment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './../../widgets/home_grid_tile.dart' as MyHome;
import '../../data/courses.dart';

class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  bool loaded = false;
  void getData() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var querySnapshot = firebaseFirestore.collection("subjects").get();
    querySnapshot.then(
      (value) {
        final docs = value.docs;
        docs.forEach(
          (doc) {
            final course = doc.data();
            courses.add(
              Course(
                id: int.parse(course['id']),
                subjectName: course['subjectName'],
                subjectCode: course['subjectCode'],
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
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return loaded
        ? Scaffold(
            appBar: AppBar(
              leading: Icon(
                Icons.ac_unit,
                size: 32,
              ),
              title: Text("Courses"),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 32,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return AddingAssignment();
                    }));
                  },
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Courses",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      FlatButton(
                        child: Text(
                          "See All",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () => {},
                      )
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(
                        courses.length,
                        (index) => MyHome.GridTile(
                          subjectID: courses[index].id,
                          subject: courses[index].subjectName,
                          subjectCode: courses[index].subjectCode,
                          color: index % 3 == 1 ? Colors.blue : Colors.green,
                        ),
                      ),
                      childAspectRatio: 5 / 4.1,
                    ),
                  ),
                ],
              ),
            ),
          )
        : CircularProgressIndicator();
  }
}
