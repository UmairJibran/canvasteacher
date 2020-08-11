import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class AssignmentDetail extends StatelessWidget {
  static const route = "/assignmentDetail";
  final Color color;
  final String title;
  final String assignmentTitle;
  final bool isPublished = true;
  final int pts = 30;
  AssignmentDetail({
    this.title,
    this.color,
    this.assignmentTitle,
  });
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = new Map();
    dataMap.putIfAbsent("Flutter", () => 5);
    dataMap.putIfAbsent("React", () => 3);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Assignment Details"),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                assignmentTitle,
                minFontSize: 20,
                maxFontSize: 34,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "$pts pts",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.cloud_done,
                    color: Colors.green,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Published",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 0.2,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    "Due",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Due: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "April 1 at 11:59 PM",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "For: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Everyone",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Available from: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "April 1 at 11:59 PM",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Available to: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "April 30 at 11:59 PM",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 0.2,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Submission Types",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                "File Upload",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "Website URL",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 0.2,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Submissions",
                style: TextStyle(color: Colors.grey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.30,
                    padding: EdgeInsets.all(5),
                    child: PieChart(
                      dataMap: dataMap,
                      chartType: ChartType.ring,
                      showLegends: false,
                      showChartValuesInPercentage: false,
                      showChartValues: false,
                      chartValueBackgroundColor: Colors.white,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.30,
                    padding: EdgeInsets.all(5),
                    child: PieChart(
                      dataMap: dataMap,
                      chartType: ChartType.ring,
                      showLegends: false,
                      showChartValuesInPercentage: false,
                      showChartValues: false,
                      chartValueBackgroundColor: Colors.white,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.30,
                    padding: EdgeInsets.all(5),
                    child: PieChart(
                      dataMap: dataMap,
                      chartType: ChartType.ring,
                      showLegends: false,
                      showChartValuesInPercentage: false,
                      showChartValues: false,
                      chartValueBackgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}