import 'package:flutter/material.dart';
import 'package:get2gether/pages/activitylist.dart';
import 'package:get2gether/pages/add_activity_page.dart';
import 'package:get2gether/pages/connections/connections.dart';
import 'package:get2gether/pages/connections/scan.dart';
import 'package:get2gether/pages/home/home.dart';
import 'package:get2gether/pages/interests.dart';
import 'package:get2gether/pages/login/login.dart';
import 'package:get2gether/pages/schedule.dart';
import 'package:get2gether/pages/signup.dart';
//import 'package:new_wra/pages/activitylist.dart';
//import 'package:new_wra/pages/add_activity_page.dart';
//import 'package:new_wra/pages/connections_page.dart';
//import 'package:new_wra/pages/home/home.dart';
//import 'package:new_wra/pages/interests.dart';
//import 'package:new_wra/pages/login/login.dart';
//import 'package:new_wra/pages/schedule.dart';
//import 'package:new_wra/pages/signup.dart';

//void main() => runApp(new MaterialApp(
//  home: new HomePage(),
//));

void main() {
  new Routes();
}

class Routes {
  Routes() {
    runApp(new MaterialApp(
      title: "Activity Picker",
      debugShowCheckedModeBanner: false,
      home: new ConnectionsPage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/login':
            return new CustomRoute(
              builder: (_) => new LoginPage(),
              settings: settings,
            );

          case '/signup':
            return new CustomRoute(
              builder: (_) => new SignUpPage(),
              settings: settings,
            );

          case '/home':
            return new CustomRoute(
              builder: (_) => new HomePage(),
              settings: settings,
            );

          case '/interests':
            return new CustomRoute(
              builder: (_) => new InterestsPage(),
              settings: settings,
            );

          case '/connections':
            return new CustomRoute(
              builder: (_) => new ConnectionsPage(),
              settings: settings,
            );

          case '/addconnection':
            return new CustomRoute(
              builder: (_) => new AddConnectionPage(),
              settings: settings,
            );

          case '/new':
            return new CustomRoute(
              builder: (_) => new AddActivityPage(),
              settings: settings,
            );

          case '/schedule':
            return new CustomRoute(
              builder: (_) => new SchedulePage(),
              settings: settings,
            );

          case '/activitylist':
            return new CustomRoute(
              builder: (_) => new ActivityListPage(),
              settings: settings,
            );
        }
      },
    )
    );
  }
}

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) {
      return child;
    } else {
      return new FadeTransition(
        opacity: animation,
        child: child,
      );
    }
  }
}