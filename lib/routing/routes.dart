import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_management_week6/view/screens/homeScreen/home_screen.dart';

const livingRoomRoute = "Living Room";
const familyRoomRoute = "Family Room";
const studioRoute = "Studio";
const kitchenRoute = "Kitchen";
const bedroomRoute = "Bedroom";
const garageRoute = "Garage";

List menuItems = [
  livingRoomRoute,
  familyRoomRoute,
  studioRoute,
  kitchenRoute,
  bedroomRoute,
  garageRoute
];
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case livingRoomRoute:
      return _getPageRoute(const HomeScreen());
    case familyRoomRoute:
      return _getPageRoute(const HomeScreen());
    case studioRoute:
      return _getPageRoute(const HomeScreen());
    case kitchenRoute:
      return _getPageRoute(const HomeScreen());
    case bedroomRoute:
      return _getPageRoute(const HomeScreen());
    case garageRoute:
      return _getPageRoute(const HomeScreen());
    default:
      return _getPageRoute(const HomeScreen());




  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
