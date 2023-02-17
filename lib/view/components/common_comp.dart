// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:fluttertoast/fluttertoast.dart';

// Project imports:
import '../../utils/colors.dart';

class CommonComponents {
  static showToast() {
    return Fluttertoast.showToast(
        msg: "Search Icon Tapped",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: white,
        fontSize: 16.0);
  }

  static Decoration decoratedContainerWhite = BoxDecoration(boxShadow: [
    BoxShadow(
      color: grey.withOpacity(0.5),
      spreadRadius: 1,
      blurRadius: 7,
      offset: const Offset(0, 3), // changes position of shadow
    ),
  ], color: white, borderRadius: const BorderRadius.all(Radius.circular(8)));

  static Container buildCircularRectangleContainer(
      {required IconData icon, VoidCallback? onPressed}) {
    return Container(
      decoration: const BoxDecoration(
          color: grey100,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: IconButton(onPressed: onPressed, icon: Icon(icon)),
    );
  }

  static Container buildCircledIconContainer(

      {required IconData icon,
      required Color bgColor,
      required Color iconColor,double? circleRadius,bool shadowRequired=true}) {
    return Container(
      height: circleRadius,
      width: circleRadius,
      decoration: BoxDecoration(
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: shadowRequired?grey.withOpacity(0.5):Colors.transparent,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
          shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
