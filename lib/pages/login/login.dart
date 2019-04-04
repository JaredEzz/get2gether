import 'package:flutter/material.dart';
import 'package:get2gether/model/database.dart';
import 'package:get2gether/model/user.dart';
import 'package:get2gether/pages/login/styles.dart';
import 'package:get2gether/pages/widget.dart';
import 'dart:math';
import 'dart:developer';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
  with TickerProviderStateMixin{
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Database database = Database();

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      // ignore: deprecated_member_use
      child: new AlertDialog(
        title: new Text('Are you sure?'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, "/home"),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ??
    false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: backgroundImage
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  const Color.fromRGBO(47, 156, 139, 0.8),
                  const Color.fromRGBO(14, 46, 41, 0.9),
                ],
                stops: [0.2, 1.0],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0)
              )
            ),
            child: ListView(
              padding: const EdgeInsets.all(0.0),
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Tick(),
                        FormContainer(usernameController: usernameController, passwordController: passwordController),
                        SignUp(),
                        Container(
                          height: 15.0,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 50.0),
                      child: RaisedButton(
                        child: const Text(
                          'Sign In',
                          textScaleFactor: 1.4,
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Color.fromRGBO(2, 66, 107, 1),
                        elevation: 16.0,
                        splashColor: Colors.blueGrey,
                        onPressed: () {
                          doLogin(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 100.0),
                      child: RaisedButton(
                        child: const Text(
                          'Fill Random User Information',
                          textScaleFactor: 1.4,
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blueGrey,
                        elevation: 16.0,
                        splashColor: Colors.blueGrey,
                        onPressed: () {
                          fillRandomUser();
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  doLogin(BuildContext context) {
    //TODO authenticate database and perform error checking
    //find user in database
//    User loginUser = database.users.singleWhere((user) => user.username == usernameController.text, orElse: () => null);
    User loginUser = database.findUser(usernameController.text);

    if(loginUser != null && loginUser.password == passwordController.text) {
      Navigator.pushNamed(context, "/home");
      database.currentUser = loginUser;
    } else {
      dialog("Login Error","Your username or password is incorrect");
    }
    //TODO add oauth for social media logins
  }

  void fillRandomUser() {
    List users = database.users;
    User randomUser = users[Random().nextInt(users.length)];
    usernameController.text = randomUser.username;
    passwordController.text = randomUser.password;
  }

  void dialog(String titleText, String contentText){
    showDialog(context: context,
      builder: (BuildContext context){
        return AlertDialog(
         title: Text(titleText),
         content: Text(contentText),
         actions: <Widget>[
           new FlatButton(
              child: Text("Try Again"),
              onPressed: (){
                Navigator.of(context).pop();
              },
           )
         ],
       );
      }
    );
  }

}