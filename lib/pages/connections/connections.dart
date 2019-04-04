import 'package:flutter/material.dart';
import 'package:get2gether/model/database.dart';
import 'package:get2gether/model/user.dart';
import 'package:get2gether/pages/connections/generate.dart';
import 'package:get2gether/pages/connections/scan.dart';
import 'package:get2gether/pages/widget.dart';

class ConnectionsPage extends StatefulWidget{
  @override
  _ConnectionsPageState createState() => new _ConnectionsPageState();
}

class _ConnectionsPageState extends State<ConnectionsPage>{
  List connections = Database().currentUser.connections;
  List connectionNames = List<String>();

  @override
  Widget build(BuildContext context) {
    for (User user in connections) {
      connectionNames.add(user.username);
    }
    return new Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: new Color.fromRGBO(2, 66, 107, 1.0),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/addconnection");
            },
            child: Container(
              margin: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.add,
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
              "CONNECTIONS",
              style: TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 3.5,
                  fontWeight: FontWeight.bold
              ),
            ),
//            Container(
//              width: 15.0,
//              height: 15.0,
//              margin: new EdgeInsets.only(bottom: 20.0),
//              alignment: Alignment.center,
//              child: Text(
//                Database().connections.length.toString(),
//                style: TextStyle(fontSize: 10.0),
//              ),
//              decoration: BoxDecoration(
//                  color: Colors.red, shape: BoxShape.circle
//              ),
//            )
          ],
        ),
      ),
      body: new Center(
        child:

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child:
                    connections.length <= 0 ?
                    const Text(
                      "You have 0 Connections"
                    ) :
                    Text(
                      "You have " + connections.length.toString() + " Connections"
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child:
                    connections.length <= 0 ?
                    Text("Empty Connections List"): Text(
                        "Here are your connections: "+ connectionNames.toString()
                    ) ,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: RaisedButton(
                        color: Color.fromRGBO(2, 66, 107, 1.0),
                        textColor: Colors.white,
                        splashColor: Colors.blueGrey,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddConnectionPage()),
                          );
                        },
                        child: const Text('Add a Connection')
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: RaisedButton(
                        color: Color.fromRGBO(2, 66, 107, 1.0),
                        textColor: Colors.white,
                        splashColor: Colors.blueGrey,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GenerateScreen()),
                          );
                        },
                        child: const Text('Share My QR Code')
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child:
                    Text("Debug Buttons")
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: RaisedButton(
                        color: Color.fromRGBO(224, 139, 124, 1.0),
                        textColor: Colors.black,
                        splashColor: Colors.pinkAccent,
                        onPressed: () {
                          connections = [];
                          Navigator.pushNamed(
                            context,
                            "/connections"
                          );
                        },
                        child: const Text('Clear Connections')
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: RaisedButton(
                        color: Color.fromRGBO(224, 139, 124, 1.0),
                        textColor: Colors.black,
                        splashColor: Colors.pinkAccent,
                        onPressed: () {
                          connections = ["mockConnection1","mockConnection2"];
                          Navigator.pushNamed(
                              context,
                              "/connections"
                          );
                        },
                        child: const Text('Fill Connections')
                    ),
                  ),
                ],
              )

      ),
    );
  }

}