import 'package:canvasteacher/screens/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _userName;
  String _password;
  bool loggingIn;
  @override
  void initState() {
    super.initState();
    loggingIn = false;
    _userName = "";
    _password = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loggingIn
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          autocorrect: false,
                          onChanged: (value) {
                            setState(() {
                              _userName = value;
                            });
                          },
                          decoration: InputDecoration(
                              hintText: "Please Enter Your UserName"),
                        ),
                        TextFormField(
                          obscureText: true,
                          autocorrect: false,
                          decoration: InputDecoration(
                              hintText: "Please Enter Your Password"),
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          color: Colors.blue[300],
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {
                            print(_userName + " -> " + _password);
                            setState(() {
                              loggingIn = true;
                            });
                            Future.delayed(Duration(seconds: 3)).then((_) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => Home(),
                                ),
                              );
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
