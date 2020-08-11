import 'package:canvasteacher/widgets/submission_tile.dart';
import 'package:flutter/material.dart';

class AssignmentSubmission extends StatelessWidget {
  static const String route = "/assignmentSubmission";
  final Color color;
  final String subject;
  const AssignmentSubmission({
    this.color,
    this.subject,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Submissions"),
            Text(
              subject,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_drop_down),
            onPressed: () => {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => {},
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All Submissions",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              SubmissionTile(
                name: "Allen Thomas",
                submitted: true,
                lateSubmission: true,
                percentage: 72.3,
                graded: true,
              ),
              SizedBox(height: 10),
              SubmissionTile(
                name: "Belinda Herrington",
                submitted: true,
                lateSubmission: false,
                percentage: 55,
                graded: true,
              ),
              SizedBox(height: 10),
              SubmissionTile(
                name: "Charlie Rose",
                submitted: true,
                lateSubmission: false,
                graded: false,
              ),
              SizedBox(height: 10),
              SubmissionTile(
                name: "Danielle Agrios",
                submitted: false,
              ),
              SizedBox(height: 10),
              SubmissionTile(
                name: "Epapharas Aliensworth",
                submitted: true,
                lateSubmission: true,
                percentage: 91.5,
                graded: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
