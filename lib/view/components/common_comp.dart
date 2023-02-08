// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:fluttertoast/fluttertoast.dart';

// Project imports:
import '../../utils/colors.dart';

class CommonComponents{
  static showToast(){
    return Fluttertoast.showToast(
        msg: "Search Icon Tapped",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: white,
        fontSize: 16.0
    );
  }

  static Decoration decoratedContainerWhite= BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
      color: white,
      borderRadius: const BorderRadius.all(Radius.circular(8)));

}
