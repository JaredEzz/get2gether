import 'package:flutter/material.dart';
import 'package:get2gether/model/database.dart';
import 'package:get2gether/model/user.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

class GenerateScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => GenerateScreenState();
}

class GenerateScreenState extends State<GenerateScreen> {

  static const double _topSectionTopPadding = 50.0;
  static const double _topSectionBottomPadding = 20.0;
  static const double _topSectionHeight = 50.0;

  GlobalKey globalKey = new GlobalKey();
  String _dataString = "Hello from this QR";
  String _inputErrorText;
  final TextEditingController _textController =  TextEditingController();
  final User currentUser = Database().currentUser;

  @override
  void initState() {
    // TODO: implement initState
    generate();
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
            onTap: _captureAndSharePng,
            child: Container(
              margin: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.share,
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
              "MY QR CODE",
              style: TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 3.5,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
      body: _contentWidget(),
    );
  }

  Future<void> _captureAndSharePng() async {
//    try {
//      RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
//      var image = await boundary.toImage();
//      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
//      Uint8List pngBytes = byteData.buffer.asUint8List();
//
//      final tempDir = await getTemporaryDirectory();
//      final file = await new File('${tempDir.path}/image.png').create();
//      await file.writeAsBytes(pngBytes);
//
//      final channel = const MethodChannel('channel:me.alfian.share/share');
//      channel.invokeMethod('shareFile', 'image.png');
//      //TODO implement sharing on iOS and Android
//
//    } catch(e) {
//      print(e.toString());
//    }
  }

  _contentWidget() {
    final bodyHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom;
    return  Container(
      color: const Color(0xFFFFFFFF),
      child:  Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: _topSectionTopPadding,
              left: 20.0,
              right: 20.0,
              bottom: _topSectionBottomPadding,
            ),
            child:  Container(
              height: _topSectionHeight,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Username:  ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
//                      decoration: TextDecoration.underline,
                      fontSize: 19
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    currentUser.username,
                    style: TextStyle(
                        fontSize: 19
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child:  Center(
              child: RepaintBoundary(
                key: globalKey,
                child: QrImage(
                  data: _dataString,
                  size: 0.5 * bodyHeight,
                  onError: (ex) {
                    print("[QR] ERROR - $ex");
                    setState((){
                      _inputErrorText = "Error! Maybe your input value is too long?";
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void generate() {
    setState((){
      _textController.text = currentUser.username;
      _dataString = _textController.text;
      _inputErrorText = null;
    });
  }
}