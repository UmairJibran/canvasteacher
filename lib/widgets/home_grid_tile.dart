import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class GridTile extends StatelessWidget {
  final color;
  final subject;
  final subjectCode;
  GridTile({
    this.color,
    this.subject,
    this.subjectCode,
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
                    // fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
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
    );
  }
}
