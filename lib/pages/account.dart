import 'package:flutter/material.dart';
import 'package:get2gether/model/database.dart';
import 'package:get2gether/model/user.dart';
import 'package:get2gether/pages/widget.dart';

class AccountPage extends StatefulWidget{
  @override
  _AccountPageState createState() => new _AccountPageState();
}

class _AccountPageState extends State<AccountPage>{
//  User currentUser = Database().currentUser;
  static User currentUser = User("jaredezz","Jared","Hasson","jaredezzethasson@gmail.com","385-439-1231",6,14);

  TextEditingController emailController = TextEditingController(text: currentUser.email);
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
              "MY ACCOUNT",
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
            title: Text("Username"),
            subtitle: Text(currentUser.username),
          ),
          ListTile(
            title: Text("First Name"),
            subtitle: Text(currentUser.first),
          ),
          ListTile(
            title: Text("Last Name"),
            subtitle: Text(currentUser.last),
          ),
          ListTile(
            title: Text("Email Address"),
            subtitle: Text(emailController.text),
            trailing: GestureDetector(
              child: Icon(
                Icons.edit,
                color: Colors.grey,
              ),
              onTap: (){
                modifyDialog("Email Address",emailController);
                //TODO futures and await for changing data fields
              },
            ),
          ),
          ListTile(
            title: Text("Phone Number"),
            subtitle: Text(currentUser.phone),
            trailing: GestureDetector(
              child: Icon(
                Icons.edit,
                color: Colors.grey,
              ),
              onTap: (){
                modifyDialog("Phone Number",emailController);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
            child: RaisedButton(
              color: Color.fromRGBO(2, 66, 107, 1.0),
              textColor: Colors.white,
              splashColor: Colors.blueGrey,
              child: Text("Reset Password"),
              onPressed: (){
                resetPasswordDialog(context);
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Interests", style: TextStyle(fontWeight: FontWeight.w500),),
          ),
          Divider(),
          ListTile(
            title: Text("Statistics:", style: TextStyle(fontWeight: FontWeight.w500),),
          ),
          ListTile(
            title: Text("Times Swiped"),
            subtitle: Text(currentUser.swipeCount.toString()),
          ),
          ListTile(
            title: Text("Activities Added"),
            subtitle: Text(currentUser.addActivityCount.toString()),
          ),
        ],
      )
    );
  }

  void resetPasswordDialog(BuildContext screenContext){
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Reset Password"),
            content: Text("This will send an email to " + currentUser.email + "\n\nAre you sure?"),
            actions: <Widget>[
              new FlatButton(
                child: Text("Yes"),
                onPressed: (){
//                  Scaffold.of(screenContext).showSnackBar(
//                      SnackBar(
//                        content: Text(
//                            "Password Reset Email Sent!"
//                        ),
//                      )
//                  );
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: Text("No"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }

  void modifyDialog(String description, TextEditingController toChange){
    TextEditingController modify = TextEditingController();
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Change "+description),
            content: TextField(
              controller: modify,
            ),
            actions: <Widget>[
              new FlatButton(
                child: Text("Update"),
                onPressed: (){
                  toChange.text = modify.text;
//                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: Text("Cancel"),
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