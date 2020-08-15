import 'package:flutter/material.dart';

class BottomSheetGradeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "Grade",
            style: TextStyle(
              fontSize: 21,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.blue,
            ),
            onPressed: () {},
          ),
        ),
        ListTile(
          title: Text(
            "Rubric",
            style: TextStyle(
              fontSize: 21,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "0 out of 20.0",
            style: TextStyle(color: Colors.grey),
          ),
          trailing: FlatButton(
            onPressed: () {},
            child: Text(
              "SAVE",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Text("Detailed Knowledge of atleast one"),
      ],
    );
  }
}
