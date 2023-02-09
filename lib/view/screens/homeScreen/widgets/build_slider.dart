// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// Project imports:
import '../../../../controller/slider_controller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constants.dart';

class BuildSlider extends StatelessWidget {
  const BuildSlider({
    Key? key,
    required SliderController sliderController,
  }) : _sliderController = sliderController, super(key: key);

  final SliderController _sliderController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(appPadding/2),
      child: Obx(
            () => Container(
          decoration:  BoxDecoration(
              color: Colors.grey.shade100.withOpacity(0.5),
              shape: BoxShape.circle),
          child: ClipRRect(

            child: Align(
              alignment: Alignment.center,
              heightFactor: 0.8,
              child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(

                        startAngle: 180,
                        endAngle: 0,
                        minimum: 0,
                        maximum: 100,

                        ticksPosition: ElementsPosition.outside,
                        showLabels: false,
                        showTicks: false,
                        radiusFactor: 0.8,
                        axisLineStyle: const AxisLineStyle(

                            cornerStyle: CornerStyle.bothCurve,
                            color: Colors.black12,
                            thickness: 15),
                        pointers: <GaugePointer>[
                          RangePointer(
                              value: _sliderController.value.value,
                              cornerStyle: CornerStyle.bothCurve,
                              width: 15,
                              sizeUnit: GaugeSizeUnit.logicalPixel,
                              gradient:  const SweepGradient(colors: <Color>[
                                yellow400,
                                yellow900,
                              ], stops: <double>[
                                0.2,
                                0.75
                              ])),
                          MarkerPointer(

                              onValueChanged: (value) {
                                _sliderController.changeSliderValue(value);
                              },
                              value: _sliderController.value.value,
                              enableDragging: true,
                              markerHeight: 18,
                              markerWidth: 18,
                              markerType: MarkerType.circle,
                              color: yellow900,
                              borderWidth: 5,
                              borderColor: Colors.white54)
                        ],
                        annotations: [
                          GaugeAnnotation(
                              angle: 90,
                              axisValue: 5,
                              positionFactor: 0.1,
                              widget: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.2),
                                      spreadRadius: 25,
                                      blurRadius: 25,
                                      offset: const Offset(
                                          3, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: white,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(appPadding + 40),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text:
                                                '${_sliderController.value.value.ceil()}',
                                                style: GoogleFonts.roboto(
                                                    fontSize: 35,
                                                    fontWeight: FontWeight.w600,
                                                    color: black)),
                                            TextSpan(
                                              text: ' %',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "Brightness",
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ])
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
