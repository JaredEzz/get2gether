import 'package:flutter/material.dart';
import 'package:get2gether/pages/widget.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: new Color.fromRGBO(2, 66, 107, 1.0),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: (){},
            child: Container(
              margin: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.done_outline,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
              style: TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 3.5,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
      body: new Center(
        child: new Text("Sign Up Test")
      ),
    );
  }

}