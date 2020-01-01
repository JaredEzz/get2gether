import 'package:flutter/material.dart';
import 'package:get2gether/model/activity.dart';
import 'package:get2gether/model/database.dart';
import 'package:get2gether/model/user.dart';
import 'package:get2gether/pages/widget.dart';

class ActivityListPage extends StatefulWidget{
  @override
  _ActivityListPageState createState() => new _ActivityListPageState();
}

class _ActivityListPageState extends State<ActivityListPage>{

  User user = Database().currentUser;
  List<Activity> currentSuggestions = Database().currentUser.suggestions;

  @override
  Widget build(BuildContext context) {
    List<Widget> suggestedActivityWidgets = genWidgets();

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
      body: new ListView(
//        children: suggestedActivityWidgets,
      children: <Widget>[
        ListTile(
          title: Text(
            "Results:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.check,
            color: Colors.green,
          ),
          title: Text(
            "Top Golf",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.check,
            color: Colors.green,
          ),
          title: Text(
            "Movies",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.check,
            color: Colors.green,
          ),
          title: Text(
            "Lagoon",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.check,
            color: Colors.green,
          ),
          title: Text(
            "Road Trip",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.check,
            color: Colors.green,
          ),
          title: Text(
            "Hot Springs",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.check,
            color: Colors.green,
          ),
          title: Text(
            "Buffalo Wild Wings",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.check,
            color: Colors.green,
          ),
          title: Text(
            "Baseball Game",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.clear,
            color: Colors.redAccent,
          ),
          title: Text(
            "Arcade",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.clear,
            color: Colors.redAccent,
          ),
          title: Text(
            "Hike Timpanogos",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.clear,
            color: Colors.redAccent,
          ),
          title: Text(
            "Fortnite",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),

      ],
      )

    );
  }

  List<Widget> genWidgets(){
    List<Widget> result = List<Widget>();
    for(Activity activity in currentSuggestions){
      result.add(
        ListTile(
          title: Text(activity.name),
        )
      );
    }
  }

}

