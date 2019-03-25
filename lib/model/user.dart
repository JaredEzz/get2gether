import 'package:get2gether/model/category.dart';
import 'package:get2gether/model/schedule.dart';

class User{
  int _id;
  String _username;
  String _password;
  String _first;
  String _last;

  List<Category> _interests;
  List<User> _connections;
  Schedule _schedule;
}