import 'package:get2gether/model/category.dart';
import 'package:get2gether/model/schedule.dart';
import 'package:flutter/material.dart';

class User{
  int _id;
  int _connectionId;
  String _username;
  String _password;
  String _first;
  String _last;

  List<Category> _interests;
  List<User> _connections;
  Schedule _schedule;
  DecorationImage _qrCode;
}