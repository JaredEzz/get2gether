import 'package:get2gether/model/user.dart';
import 'dart:math';

class Location{
  double _latitude;
  double _longitude;

  Location.random(){
    _latitude = Random().nextDouble();
    _longitude = Random().nextDouble();
  }

  String _distanceFromUser(User user){
    int distance = 15;
    //calculate activity latlong from user lat long
    String units = user.units;
    return distance.toString() + units;
  }
}