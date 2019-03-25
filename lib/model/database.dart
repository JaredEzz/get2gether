import 'package:flutter/material.dart';
import 'package:get2gether/model/event.dart';
import 'package:get2gether/pages/home/styles.dart';

class Database {
  static final Database _db = Database._internal();

  List _eventImages = [image1, image2, image3, image4, image5, image6];

  List get events => _eventImages;

  set events(List value) {
    _eventImages = value;
  }

  Database._internal();

  factory Database() {
    return _db;
  }


}