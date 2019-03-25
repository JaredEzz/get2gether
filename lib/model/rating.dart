import 'package:get2gether/model/review.dart';

class Rating {
  double _totalScore;
  List<Review> reviews;

  Rating(){
    _totalScore = 0.0;
  }
}