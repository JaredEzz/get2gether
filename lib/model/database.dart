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
  List<DecorationImage> _result;

  List _activities = [
  new Activity.limited2(image6, "Top Golf"),
  new Activity.limited2(image5, "Water Park"),
  new Activity.limited2(image4, "Watch Sports at the Bar"),
  new Activity.limited2(image3, "Hiking"),
  new Activity.limited2(image2, "Movies"),
  new Activity.limited2(image1, "Comedy Club")
  ];

  List _activityImages = [image6,image5,image4,image3,image2,image1];

  Activity specificActivity(int index){
    return activities[index];
  }

  List get activities => _activities;

  set activities(List value) {
    _activities = value;
  }

  List get connections => _connections;

  set connections(List value) {
    _connections = value;
  }

  List get activityImages => _activityImages;

  set activityImages(List value) {
    _activityImages = value;
  }


}