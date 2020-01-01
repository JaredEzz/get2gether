import 'package:flutter/material.dart';
import 'package:get2gether/model/activity.dart';
import 'package:get2gether/model/category.dart';
import 'package:get2gether/model/database.dart';
import 'package:get2gether/model/rating.dart';
import 'package:get2gether/pages/widget.dart';

class AddActivityPage extends StatefulWidget{
  @override
  _AddActivityPageState createState() => new _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage>{
  TextEditingController nameController = new TextEditingController();
  TextEditingController imageURLController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController categoryController = new TextEditingController();

  @override
  void initState() {
    nameController.text = "";
    imageURLController.text = "";
    descriptionController.text = "";
    locationController.text = "";
    categoryController.text = "";
    super.initState();
  }

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
              "ADD ACTIVITY",
              style: TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 3.5,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: TextField(
              controller: nameController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: "Activity Name",
                hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.info_outline,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: TextField(
              controller: imageURLController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: "Image ",
                //TODO insert an optional image as default
                hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.image,
                  color: Colors.black,
                ),
                suffixIcon: const Icon(
                  Icons.file_upload,
                  color: Colors.black,
                )
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: TextField(
              controller: descriptionController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: "Description",
                hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: TextField(
              controller: locationController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: "Location",
                hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.location_on,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: TextField(
              controller: categoryController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: "Categories",
                //TODO search existing categories and select from a list
                hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.category,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: RaisedButton(
                color: Color.fromRGBO(2, 66, 107, 1.0),
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: () {
                  addActivity();
                  Navigator.of(context).pop();
                },
                child: const Text('Done')
            ),
          ),
        ],
      )
    );
  }

  void addActivity() {
    Database().activities.add(
        new Activity(
            new DecorationImage(image: NetworkImage(imageURLController.text)),
            null,
            nameController.text,
            descriptionController.text,
            new Rating(),
            new List<Category>()
        )
    );
  }

  //TODO link to google maps specific instance rather than lat-lon.

}