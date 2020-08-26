import 'package:auto_size_text/auto_size_text.dart';
import 'package:canvasteacher/models/assignment_model.dart';
import 'package:canvasteacher/screens/assignemnt_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AssignmentTile extends StatelessWidget {
  AssignmentTile(this.course, {this.assignment, this.color});
  final bool haveDue = false;
  final String course;
  final Assignment assignment;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black12,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => AssignmentDetail(
              title: course,
              color: color,
              assignment: assignment,
            ),
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.17,
        padding: EdgeInsets.only(top: 12),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.1,
                child: Stack(
                  children: [
                    Icon(
                      Icons.insert_drive_file,
                      size: 40,
                      color: color,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.only(top: 2.0, left: 2.5),
                          color: Colors.white,
                          child: Icon(
                            haveDue ? Icons.cloud_done : Icons.cloud_off,
                            color: haveDue ? Colors.green : Colors.grey,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "${assignment.assignmentTitle}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    maxFontSize: 26,
                    minFontSize: 12,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Due at ${DateFormat.yMMMd().format(assignment.dueTime)}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: color),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.0,
                      vertical: 3.0,
                    ),
                    child: Text(
                      "${assignment.needsGrading} Needs Grading",
                      style: TextStyle(color: color),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
