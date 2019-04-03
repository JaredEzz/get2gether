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
  String _phone;
  String _email;
  int _swipeCount;
  int _addActivityCount;
  String _units = "miles";

  List<Category> _interests;
  List<User> _connections;
  Schedule _schedule;
  DecorationImage _qrCode;

  User.simple(this._username,this._password);
  User(this._username,this._first,this._last,this._email,this._phone, this._addActivityCount, this._swipeCount);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  int get connectionId => _connectionId;

  set connectionId(int value) {
    _connectionId = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get first => _first;

  set first(String value) {
    _first = value;
  }

  String get last => _last;

  set last(String value) {
    _last = value;
  }

  String get units => _units;

  set units(String value) {
    _units = value;
  }

  List<Category> get interests => _interests;

  set interests(List<Category> value) {
    _interests = value;
  }

  List<User> get connections => _connections;

  set connections(List<User> value) {
    _connections = value;
  }

  Schedule get schedule => _schedule;

  set schedule(Schedule value) {
    _schedule = value;
  }

  DecorationImage get qrCode => _qrCode;

  set qrCode(DecorationImage value) {
    _qrCode = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  int get addActivityCount => _addActivityCount;

  set addActivityCount(int value) {
    _addActivityCount = value;
  }

  int get swipeCount => _swipeCount;

  set swipeCount(int value) {
    _swipeCount = value;
  }


}