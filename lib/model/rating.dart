import 'package:get2gether/model/review.dart';
import 'dart:math';


class Rating {
  double _totalScore;
  List<Review> reviews;

  Rating(){
    _totalScore = Random().nextDouble()*5;
  }
}