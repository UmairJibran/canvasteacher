import 'package:flutter/material.dart';
// import 'package:quill_delta/quill_delta.dart';
// import 'package:zefyr/zefyr.dart';

class GradeScreen extends StatefulWidget {
  static const String route = "/gradeScreen";
  final String name;
  final bool lateSubmission;
  GradeScreen({this.name, this.lateSubmission});

  @override
  _GradeScreenState createState() => _GradeScreenState();
}

class _GradeScreenState extends State<GradeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    //   ZefyrController _zefyrController;
    //   FocusNode _focusNode;

    //   NotusDocument _loadDocument() {
    //     final Delta delta = Delta()..insert("File");
    //     return NotusDocument.fromDelta(delta);
    //   }

    //   @override
    //   void initState() {
    //     super.initState();
    //     NotusDocument document;
    //     document = _loadDocument();
    //     _zefyrController = ZefyrController(document);
    //     _focusNode = FocusNode();
    //   }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.lightBlueAccent,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    widget.lateSubmission
                        ? Text(
                            "Late",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 15,
                            ),
                          )
                        : Text(
                            "Submitted",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                            ),
                          )
                  ],
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.mode_edit,
                color: Colors.black,
              ),
              onPressed: () => {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Center(
          child: Text("Grade"),
        ),
        onPressed: () {
          _showBottomSheet(context);
        },
      ),
      body: Container(
          // child: ZefyrScaffold(
          //   child: ZefyrEditor(
          //     controller: _zefyrController,
          //     focusNode: _focusNode,
          //     padding: EdgeInsets.all(8),
          //     toolbarDelegate: null,
          //   ),
          // ),
          ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    List<String> options = ["GRADE", "COMMENTS", "FILES"];
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return FlatButton(
                    child: Text(
                      options[index],
                      style: selectedIndex == index
                          ? TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            )
                          : TextStyle(),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          selectedIndex = index;
                        },
                      );
                    },
                  );
                },
              ),
            ),
            Text(
              options[selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}
