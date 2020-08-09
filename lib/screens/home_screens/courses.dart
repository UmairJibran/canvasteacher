import 'package:flutter/material.dart';
import './../../widgets/home_grid_tile.dart' as MyHome;
import '../../data/courses.dart';

class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () => {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(5),
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
              height: MediaQuery.of(context).size.height * 0.71,
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  subjects.length,
                  (index) => MyHome.GridTile(
                    subjectID: subjects[index]['id'],
                    color: subjects[index]["color"],
                    subject: subjects[index]["subjectName"],
                    subjectCode: subjects[index]["subjectCode"],
                  ),
                ),
                childAspectRatio: 5 / 4.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
