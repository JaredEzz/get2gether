import 'package:get2gether/model/user.dart';

class Location{
  double _latitude;
  double _longitude;

  String _distanceFromUser(User user){
    int distance = 15;
    //calculate activity latlong from user lat long
    String units = user.units;
    return distance.toString() + units;
  }
}