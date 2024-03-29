import 'package:flutter/material.dart';
import 'package:get2gether/model/activity.dart';
import 'package:get2gether/model/database.dart';
import 'package:get2gether/model/user.dart';
import 'package:get2gether/pages/home/activecard.dart';
import 'package:get2gether/pages/home/backgroundCard.dart';
import 'package:get2gether/pages/widget.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  AnimationController _buttonController;
  AnimationController _screenController;
  Animation<double> rotate;
  Animation<double> right;
  Animation<double> bottom;
  Animation<double> width;
  Animation<Color> fadeScreenAnimation;
  int flag = 0;
  List data = Database().activityImages;
  List activities = Database().activities;
  List selectedData = [];
  User currentUser = Database().currentUser;

  void initState() {
    super.initState();

    _screenController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);

    _buttonController = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);

    fadeScreenAnimation = new ColorTween(
      begin: const Color.fromRGBO(106, 94, 175, 1.0),
      end: const Color.fromRGBO(106, 94, 175, 0.0),
    )
        .animate(
      new CurvedAnimation(
        parent: _screenController,
        curve: Curves.ease,
      ),
    );

    rotate = new Tween<double>(
      begin: -0.0,
      end: -40.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    rotate.addListener(() {
      setState(() {
        if (rotate.isCompleted) {
          var i = data.removeLast();
          data.insert(0, i);
          //TODO add counting logic
          _buttonController.reset();
        }
      });
    });

    right = new Tween<double>(
      begin: 0.0,
      end: 400.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    bottom = new Tween<double>(
      begin: 15.0,
      end: 100.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    width = new Tween<double>(
      begin: 20.0,
      end: 25.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.bounceOut,
      ),
    );


  }

  @override
  Widget build(BuildContext context) {

    GlobalKey<ScaffoldState> _scaffoldKey;
    if (_scaffoldKey == null) {
      _scaffoldKey = new GlobalKey<ScaffoldState>();
    }

    var dataLength = data.length;
    double initialBottom = 15.0;
    double backCardPosition = initialBottom + (dataLength - 1) * 10 + 10;
    double backCardWidth = -10.0;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: new Color.fromRGBO(2, 66, 107, 1.0),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/connections");
            },
            child: Container(
              margin: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.people,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/activitylist");
              },
              child: Text(
                "ACTIVITIES",
                style: TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 3.5,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              width: 15.0,
              height: 15.0,
              margin: new EdgeInsets.only(bottom: 20.0),
              alignment: Alignment.center,
              child: Text(
                dataLength.toString(),
                style: TextStyle(fontSize: 10.0),
              ),
              decoration: BoxDecoration(
                color: Colors.red, shape: BoxShape.circle
              ),
            )
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: Container(
        color: Color.fromRGBO(2, 66, 107, 1.0),
        alignment: AlignmentDirectional.center,
        child: dataLength > 0 ?
          Stack(
              alignment: AlignmentDirectional.center,
              children: data.map((item) {
                if (data.indexOf(item) == dataLength - 1) {
                  return cardDemo(
                      item,
                      bottom.value,
                      right.value,
                      0.0,
                      backCardWidth + 10,
                      rotate.value,
                      rotate.value < -10 ? 0.1 : 0.0,
                      context,
                      dismissImg,
                      flag,
                      addImg,
                      swipeRight,
                      swipeLeft,
                  );
                } else {
                  backCardPosition = backCardPosition - 10;
                  backCardWidth = backCardWidth + 10;

                  return backgroundCard(item, backCardPosition, 0.0, 0.0,
                      backCardWidth, 0.0, 0.0, context);
                }
              }).toList())
            : new Text("No Activities Left.",
        style: new TextStyle(color: Colors.white, fontSize:  30.0)),
      ),
    );
  }

  dismissImg(DecorationImage img) {
    int activityId = data.indexOf(img);
    setState(() {
      data.remove(img);
      //TODO add logic
    });
  }

  addImg(DecorationImage img) {
    addSuggestedActivity(img);
    setState(() {
      data.remove(img);
      selectedData.add(img);
    });
  }

  swipeRight() {
    if (flag == 0)
      setState(() {
        flag = 1;
      });
    _swipeAnimation();
  }

  swipeLeft() {
    if (flag == 1)
      setState(() {
        flag = 0;
      });
    _swipeAnimation();
  }

  Future<Null> _swipeAnimation() async {
    try {
      await _buttonController.forward();
    } on TickerCanceled {}
  }

  void addSuggestedActivity(DecorationImage img) {
    String activityId = activities[data.indexOf(img)].id;
    Activity toAdd = Database().findActivity(activityId);

    if (toAdd != null) {
      currentUser.suggestions.add(toAdd);
    }
  }

}