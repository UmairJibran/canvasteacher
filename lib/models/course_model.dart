import 'package:flutter/material.dart';

class Course {
  int id;
  String subjectCode;
  String subjectName;
  Color color;

  Course({
    this.id,
    this.subjectCode,
    this.subjectName,
    this.color,
  });

  Course.fromMap(Map snapshot, String id)
      : id = id ?? 0,
        subjectCode = snapshot['subjectCode'] ?? '',
        subjectName = snapshot['subjectName'] ?? '',
        color = new Color(snapshot['color']) ?? null;

  toJson() {
    return {
      "subjectCode": subjectCode,
      "subjectName": subjectName,
      "color": color,
    };
  }
}
