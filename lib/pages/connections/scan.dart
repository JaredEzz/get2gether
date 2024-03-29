
import 'dart:async';
import 'dart:math';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get2gether/model/database.dart';
import 'package:get2gether/model/user.dart';

class AddConnectionPage extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<AddConnectionPage> {
  String barcode = "";
  String successMessage = "";
  User currentUser = Database().currentUser;
  List users = Database().users;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: new Color.fromRGBO(2, 66, 107, 1.0),
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(
              onTap: scan,
              child: Container(
                margin: const EdgeInsets.all(15.0),
                child: Icon(
                  Icons.camera_alt,
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
                "ADD CONNECTION",
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
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text("Instructions: Scan the QR Code of someone you'd like to connect with.", textAlign: TextAlign.center,),
                //TODO implement uploading a qr code someone has shared with you
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: RaisedButton(
                    color: Color.fromRGBO(2, 66, 107, 1.0),
                    textColor: Colors.white,
                    splashColor: Colors.blueGrey,
                    onPressed: scan,
                    child: const Text('Scan a QR Code')
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: RaisedButton(
                    color: Color.fromRGBO(224, 139, 124, 1.0),
                    textColor: Colors.white,
                    splashColor: Colors.blueGrey,
                    onPressed: (){
                      User randomUser = users[Random().nextInt(users.length)];
                      addConnection(randomUser.username);
                    },
                    child: const Text('Test - Add a Random Connection')
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  successMessage,
                  textAlign: TextAlign.center,),
              ),
            ],
          ),
        ));
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      addConnection(barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.successMessage = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.successMessage = 'null (User returned using the "back"-button before scanning anything)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  void addConnection(String barcode) {
    User toAdd = Database().findUser(barcode);
    if(toAdd == null){
      noExistingUsernameDialog();
    }else{
      setState(() => this.successMessage = 'Connection Successfully Added – ' + barcode);
      currentUser.connections.add(toAdd);
    }
  }

  void noExistingUsernameDialog(){
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("ok"),
            content: Text("ok"),
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