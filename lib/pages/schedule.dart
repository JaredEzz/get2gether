import 'package:flutter/material.dart';
import 'package:get2gether/pages/widget.dart';

class SchedulePage extends StatefulWidget{
  @override
  _SchedulePageState createState() => new _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>{

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
                Icons.check_box_outline_blank,
                color: Color.fromRGBO(2, 66, 107, 1.0),
                size: 30.0,
              ),
            ),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SCHEDULE",
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
          child: new Text("Schedule Test")
      ),
    );
  }

}