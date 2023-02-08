// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:home_management_week6/utils/constants.dart';
import 'package:home_management_week6/view/screens/homeScreen/widgets/build_container_row_items.dart';
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
          children: const [
            BuildContainerRow()
          ],
        ),
      ),
    );
  }
}


