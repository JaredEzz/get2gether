import 'package:flutter/material.dart';
import 'package:get2gether/pages/widget.dart';

class ActivityListPage extends StatefulWidget{
  @override
  _ActivityListPageState createState() => new _ActivityListPageState();
}

class _ActivityListPageState extends State<ActivityListPage>{

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
              "ACTIVITY LIST",
              style: TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 3.5,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: new Center(
          child: new Text("Activity List Test")
      ),
    );
  }

}