import 'package:flutter/material.dart';
import 'package:get2gether/pages/widget.dart';

class ConnectionsPage extends StatefulWidget{
  @override
  _ConnectionsPageState createState() => new _ConnectionsPageState();
}

class _ConnectionsPageState extends State<ConnectionsPage>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text("Connections Test")),
      drawer: CustomDrawer(),
      body: new Center(
          child: new Text("Connections Test")
      ),
    );
  }

}