import 'package:flutter/material.dart';
import 'package:get2gether/pages/widget.dart';


class InterestsPage extends StatefulWidget{
  @override
  _InterestsPageState createState() => new _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text("Interests Test")),
      drawer: CustomDrawer(),
      body: new Center(
          child: new Text("Interests Test")
      ),
    );
  }

}