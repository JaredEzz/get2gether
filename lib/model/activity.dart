import 'package:flutter/material.dart';
import 'package:get2gether/model/category.dart';
import 'package:get2gether/model/rating.dart';

class Activity{
  DecorationImage _mainDecorationImage;
  List<DecorationImage> _images;
  String _name;
  String _description;
  Rating _rating;
  List<Category> _categories;

  Activity.blank();

  Activity(this._mainDecorationImage,this._images,this._name,this._description, this._rating, this._categories);

}

class ScheduledActivity extends Activity {

  ScheduledActivity(this._dateTime) : super.blank();
  DateTime _dateTime;
}