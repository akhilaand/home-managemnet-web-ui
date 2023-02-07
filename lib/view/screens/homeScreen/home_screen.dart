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
            Container(
              height: 150,
              width: 150,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }


}
