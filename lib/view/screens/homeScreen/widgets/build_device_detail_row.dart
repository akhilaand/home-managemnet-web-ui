// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:


// Project imports:
import '../../../../controller/slider_controller.dart';
import '../../../components/common_comp.dart';
import 'build_slider.dart';

class BuildDeviceDetailRowContainer extends StatelessWidget {
  const BuildDeviceDetailRowContainer({
    Key? key,
    required SliderController sliderController,
  })  : _sliderController = sliderController,
        super(key: key);

  final SliderController _sliderController;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: CommonComponents.decoratedContainerWhite,
        child: BuildSlider(sliderController: _sliderController));
  }
}


