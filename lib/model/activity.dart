import 'package:flutter/material.dart';
import 'package:get2gether/model/category.dart';
import 'package:get2gether/model/location.dart';
import 'package:get2gether/model/rating.dart';

class Activity{
  DecorationImage _mainDecorationImage;
  List<DecorationImage> _images;
  String _name;
  String _description;
  Rating _rating;
  List<Category> _categories;
  Location _location;

  Activity.blank();

  Activity.limited1(this._mainDecorationImage,this._name,this._description);
  Activity.limited2(this._mainDecorationImage,this._name){
    _description = "";
    _images = [];
    _rating = Rating();
    _categories = [];
    _location = Location.random();
  }

  Activity(this._mainDecorationImage,this._images,this._name,this._description, this._rating, this._categories);

  List<Category> get categories => _categories;

  set categories(List<Category> value) {
    _categories = value;
  }

  Rating get rating => _rating;

  set rating(Rating value) {
    _rating = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  List<DecorationImage> get images => _images;

  set images(List<DecorationImage> value) {
    _images = value;
  }

  DecorationImage get mainDecorationImage => _mainDecorationImage;

  set mainDecorationImage(DecorationImage value) {
    _mainDecorationImage = value;
  }


}

class ScheduledActivity extends Activity {

  ScheduledActivity(this._dateTime) : super.blank();
  DateTime _dateTime;
}