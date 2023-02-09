// Flutter imports:
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Package imports:


// Project imports:
import '../../../../controller/slider_controller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/style.dart';
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
    Size size=MediaQuery.of(context).size;
    return Container(
        decoration: CommonComponents.decoratedContainerWhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: buildLIghtControlWIdget(size)),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:  BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: white,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                 height: 400,
                  width: 50,
                ),
              ),
            )
          ],
        ));
  }

  Column buildLIghtControlWIdget(Size size) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width:size.width/3.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(

                        children: [
                          CommonComponents.buildCircularRectangleContainer(
                              icon: Icons.notifications_none_rounded,
                              onPressed: null),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 3, left: 8,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Smart Lamp",
                                  style: toolBarEnabledItemStyle,
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  "2 Lights",
                                  style: GoogleFonts.roboto(
                                      color: grey400, fontSize: 12),
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Switch(value: true, onChanged: (value){}),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration:  BoxDecoration(
                              color: white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0,0), // changes position of shadow
                                  ),
                                ],
                              shape: BoxShape.circle
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(Icons.more_horiz),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              FractionalTranslation(
                  translation: const Offset(-0.1,0),
                  child: BuildSlider(sliderController: _sliderController)),
            ],
          );
  }
}


