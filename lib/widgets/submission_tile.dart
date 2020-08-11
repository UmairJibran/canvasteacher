import 'package:flutter/material.dart';

class SubmissionTile extends StatelessWidget {
  final String name;
  final bool submitted;
  final bool lateSubmission;
  final bool graded;
  final double percentage;

  const SubmissionTile({
    this.graded,
    this.name,
    this.submitted,
    this.lateSubmission,
    this.percentage,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.cyan,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  submitted
                      ? lateSubmission
                          ? Text(
                              "Late",
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              "Submitted",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                      : Text(
                          "Not submitted",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                ],
              ),
            ],
          ),
          submitted
              ? graded
                  ? Text("$percentage%")
                  : Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Need Grading",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    )
              : SizedBox(),
        ],
      ),
    );
  }
}
