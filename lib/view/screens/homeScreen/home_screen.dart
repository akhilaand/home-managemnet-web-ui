// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


// Project imports:
import 'package:home_management_week6/utils/constants.dart';
import 'package:home_management_week6/view/screens/homeScreen/widgets/build_container_row_items.dart';
import 'package:home_management_week6/view/screens/homeScreen/widgets/build_device_detail_row.dart';
import '../../../controller/slider_controller.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final SliderController _sliderController = Get.put(SliderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            appPadding / 2, appPadding / 2, appPadding / 2, appPadding),
        child: ListView(
          children: [
            const BuildContainerRow(),
            const SizedBox(
              height: 10,
            ),
            BuildDeviceDetailRowContainer(sliderController: _sliderController)
          ],
        ),
      ),
    );
  }
}

