import 'package:flutter/material.dart';
import 'package:get2gether/pages/widget.dart';


class InterestsPage extends StatefulWidget{
  @override
  _InterestsPageState createState() => new _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage>{
  bool isOn1 = false;
  bool isOn2 = false;
  bool isOn3 = false;
  bool isOn4 = false;
  bool isOn5 = false;
  bool isOn6 = false;
  bool isOn7 = false;
  bool isOn8 = false;

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
              child: GestureDetector(
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 30.0,
                ),
                onTap: (){
                  Navigator.of(context).pop();
                },
              )
            ),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "INTERESTS",
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
          children: <Widget>[
            ListTile(
              title: Text(
                "Select one or more of the following categories you're interested in:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
              ),
            ),
            ListTile(
              leading: Checkbox(
                  value: isOn1,
                  onChanged: (value){
                    setState(() {
                      isOn1 = value;
                    });
                  }
              ),
              title: Text(
                "Outdoors",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            ListTile(
              leading: Checkbox(
                  value: isOn2,
                  onChanged: (value){
                    setState(() {
                      isOn2 = value;
                    });
                  }
              ),
              title: Text(
                "Water Sports",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            ListTile(
              leading: Checkbox(
                  value: isOn3,
                  onChanged: (value){
                    setState(() {
                      isOn3 = value;
                    });
                  }
              ),
              title: Text(
                "Educational",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            ListTile(
              leading: Checkbox(
                  value: isOn4,
                  onChanged: (value){
                    setState(() {
                      isOn4 = value;
                    });
                  }
              ),
              title: Text(
                "Art & Creativity",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            ListTile(
              leading: Checkbox(
                  value: isOn5,
                  onChanged: (value){
                    setState(() {
                      isOn5 = value;
                    });
                  }
              ),
              title: Text(
                "Electronics",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            ListTile(
              leading: Checkbox(
                  value: isOn6,
                  onChanged: (value){
                    setState(() {
                      isOn6 = value;
                    });
                  }
              ),
              title: Text(
                "Community Involvement",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            ListTile(
              leading: Checkbox(
                  value: isOn7,
                  onChanged: (value){
                    setState(() {
                      isOn7 = value;
                    });
                  }
              ),
              title: Text(
                "Pop Culture",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            ListTile(
              leading: Checkbox(
                  value: isOn8,
                  onChanged: (value){
                    setState(() {
                      isOn8 = value;
                    });
                  }
              ),
              title: Text(
                "Food & Entertaiment",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),

          ]
      ),
    );
  }

}