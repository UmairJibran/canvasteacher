import 'package:auto_size_text/auto_size_text.dart';
import 'package:canvasteacher/screens/course_detail_screen.dart';
import 'package:flutter/material.dart';

class GridTile extends StatelessWidget {
  final color;
  final subject;
  final subjectCode;
  final subjectID;
  GridTile({
    this.color,
    this.subject,
    this.subjectCode,
    this.subjectID,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 5, left: 5),
      decoration: BoxDecoration(
        boxShadow: [
          new BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
            spreadRadius: 5,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CourseDetailScreen(courseID: subjectID),
              ),
            );
          },
          splashColor: Colors.black12,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.13,
                color: color,
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  onPressed: () => {},
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.096,
                color: Colors.white,
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      subject,
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      maxFontSize: 26,
                      minFontSize: 12,
                    ),
                    Text(
                      subjectCode,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
