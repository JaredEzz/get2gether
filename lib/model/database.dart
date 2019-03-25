import 'package:flutter/material.dart';
import 'package:get2gether/model/activity.dart';
import 'package:get2gether/pages/home/styles.dart';

class Database {
  static final Database _db = Database._internal();

  Database._internal();

  factory Database() {
    return _db;
  }

  List _connections = ["Friend1","Friend2"];

  List _activities = [];

  List _eventImages = [image1, image2, image3, image4, image5, image6];

  List get connections => _connections;

  set connections(List value) {
    _connections = value;
  }

  List get events => _eventImages;

  set events(List value) {
    _eventImages = value;
  }


}