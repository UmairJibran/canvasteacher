import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddingAssignment extends StatefulWidget {
  static const String route = "/adding";

  @override
  _AddingAssignmentState createState() => _AddingAssignmentState();
}

class _AddingAssignmentState extends State<AddingAssignment> {
  final formKey = GlobalKey<FormState>();
  String _assignmentTitle = "";
  int _subjectID = 0;
  DateTime _dueDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adding Assignment"),
        centerTitle: true,
      ),
      body: Container(
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 10),
              TextFormField(
                initialValue: _assignmentTitle,
                onChanged: (value) {
                  setState(() {
                    _assignmentTitle = value;
                  });
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter Assignment Title";
                  } else {
                    return null;
                  }
                },
                textCapitalization: TextCapitalization.characters,
                enableSuggestions: false,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Assignment Title",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
              TextFormField(
                initialValue: _subjectID.toString(),
                onChanged: (value) {
                  setState(() {
                    _subjectID = int.parse(value);
                    print(_subjectID);
                  });
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter Subject ID";
                  } else {
                    return null;
                  }
                },
                enableSuggestions: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Subject ID",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Assignment Due Date (${DateFormat("yyyy-MM-dd").pattern})'),
              DateTimeField(
                format: DateFormat("yyyy-MM-dd"),
                onChanged: (value) {
                  setState(() {
                    _dueDate = value;
                  });
                },
                onShowPicker: (context, currentValue) async {
                  return showDatePicker(
                    context: context,
                    firstDate: currentValue ?? DateTime.now(),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                },
              ),
              FlatButton(
                onPressed: () {
                  FirebaseFirestore firebaseFirestore =
                      FirebaseFirestore.instance;
                  firebaseFirestore.collection("assignments").add({
                    "assignmentTitle": _assignmentTitle,
                    "subjectId": _subjectID,
                    "dueTime": _dueDate,
                    "upDate": DateTime.now(),
                    "needGrading": 50,
                  }).then(
                    (value) {
                      Navigator.of(context).pop();
                    },
                  );
                },
                child: Text("Upload"),
                color: Colors.blue[200],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
