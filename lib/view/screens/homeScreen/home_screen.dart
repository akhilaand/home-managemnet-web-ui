import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_management_week6/utils/colors.dart';
import 'package:home_management_week6/utils/constants.dart';

import '../../../utils/style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            appPadding / 2, appPadding / 2, appPadding / 2, appPadding),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Padding(
                    padding: EdgeInsets.all(appPadding / 4),
                    child: Icon(
                      Icons.add,
                      color: white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                buildToolBarItem(itemTitle: "Living Room",isEnabled: true),
                buildToolBarItem(itemTitle: "Family Room",isEnabled: false),
                buildToolBarItem(itemTitle: "Studio",isEnabled: false),
                buildToolBarItem(itemTitle: "Kitchen",isEnabled: false),
                buildToolBarItem(itemTitle: "Bedroom",isEnabled: false),
                buildToolBarItem(itemTitle: "Garage",isEnabled: false),


              ],
            )
          ],
        ),
      ),
    );
  }

  Padding buildToolBarItem({required itemTitle,required isEnabled}) {
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  itemTitle,
                  style: isEnabled?toolBarEnabledItemStyle:toolBarDisabledItemStyle,
                ),
              );
  }
}
