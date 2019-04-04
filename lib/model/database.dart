import 'package:flutter/material.dart';
import 'package:get2gether/model/activity.dart';
import 'package:get2gether/model/user.dart';
import 'package:get2gether/pages/home/styles.dart';

class Database {
  static final Database _db = Database._internal();

  Database._internal();

  factory Database() {
    return _db;
  }

  User _currentUser;

  User get currentUser => _currentUser;

  set currentUser(User value) {
    _currentUser = value;
  }

  List _users = [
//                  new User.simple("jaredhasson","mypassword"),
                  new User.simple("JuliusCaesar", "rome"),
                  new User.simple("KatnissEverdeen", "hungergames"),
                  new User.simple("DonkeyKong", "mario"),
                  new User.simple("ArnoldSchwarzenegger", "terminator"),
                  new User.simple("JenniferAniston", "friends"),
                  new User.simple("MasterChief", "halo"),
                  new User.simple("JamesHarden", "houston"),
                  new User.simple("MichaelJordan", "basketball"),
                  new User.simple("LebronJames", "miami"),
                  new User.simple("BabeRuth", "yankees"),
                  new User.simple("TomCruise", "impossible"),
                  new User.simple("BilboBaggins", "hobbit"),
                  new User.simple("DominicToretto", "fast"),
                  new User.simple("PokemonTrainer", "torterra"),
                  new User.simple("SitoruIwata", "legend"),
                  new User.simple("PrincessZelda", "link"),
                  new User.simple("DwayneJohnson", "therock"),
                  new User.simple("NilayPatel", "theverge"),
                  new User.simple("DieterBohn", "promocode"),
                  new User.simple("PaulMiller", "fuschiaisbetterthanandroid"),
                  new User.simple("WreckItRalph", "penelope"),
                  new User.simple("CharlieBrown", "peanuts"),
                  new User.simple("LightningMcQueen", "kachow"),
  ];

  List get users => _users;
  List _connections = ["Friend1","Friend2"];

  List _activities = [
  new Activity.limited1(image6, "Lagoon","Lagoon is a privately owned amusement park in Farmington, Utah, United States, located about 18 miles north of Salt Lake City."),
  new Activity.limited1(image5, "Relax at a Water Park","A water park or waterpark is an amusement park that features water play areas such as swimming pools, water slides, splash pads, water playgrounds, and lazy rivers, as well as areas for bathing, swimming, and other barefoot environments."),
  new Activity.limited1(image4, "Watch the Game at Buffalo Wild Wings","Buffalo Wild Wings is an American casual dining restaurant and sports bar franchise in the United States, Canada, India, Mexico, Oman, Panama, Philippines, Saudi Arabia, United Arab Emirates, and Vietnam which specializes in Buffalo wings and sauces."),
  new Activity.limited1(image3, "Hike Mount Timpanogos","Mount Timpanogos, often referred to as Timp, is the second highest mountain in Utah's Wasatch Range. Timpanogos rises to an elevation of 11,752 ft above sea level in the Uinta-Wasatch-Cache National Forest."),
  new Activity.limited1(image2, "See a Movie @ Cinemark","Cinemark USA, Inc. is an American movie theater chain owned by Cinemark Holdings, Inc. operating throughout the Americas and in Taiwan. It is headquartered in Plano, Texas, in the Dallas–Fort Worth area. It is the largest movie theatre chain in Brazil, with a 30 percent market share."),
  new Activity.limited1(image1, "Top Golf","A sports entertainment complex that features an inclusive, high-tech golf game that everyone can enjoy. Paired with an outstanding food and beverage menu, climate-controlled hitting bays and music, every Topgolf has an energetic hum that you can feel right when you walk through the door."),
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

  User findUser(String username){
    return users.singleWhere((user) => user.username == username, orElse: () => null);
  }

}