// Flutter imports:

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_management_week6/controller/ui_controllers.dart';
import 'package:home_management_week6/utils/constants.dart';
import 'package:chips_choice/chips_choice.dart';

// Package imports:

// Project imports:
import '../../../../controller/slider_controller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/style.dart';
import '../../../components/common_comp.dart';
import 'build_slider.dart';

class BuildDeviceDetailRowContainer extends StatelessWidget {
   BuildDeviceDetailRowContainer({
    Key? key,
    required SliderController sliderController,
  })  : _sliderController = sliderController,
        super(key: key);

  final SliderController _sliderController;
  final UiClassControllers _uiClassControllers=Get.put(UiClassControllers());
   List<String> options = [
     'News', 'Entertainment', 'Politics',
   ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: CommonComponents.decoratedContainerWhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: buildLIghtControlWIdget(size)),


            Expanded(
              flex: 1,
              child: buildDeviceOperationsWidget(),
            )
          ],
        ));
  }

  Padding buildDeviceOperationsWidget() {
    return Padding(
        padding: const EdgeInsets.all(appPadding),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ], color: white, borderRadius: BorderRadius.all(Radius.circular(15))),
          height: 380,
          width: 50,
          child: Column(
            children: [
              buildPowerUsageContainer(),
              MultiSelectChip(options)
              // ChipsChoice<int>.single(
              //   choiceStyle:  C2ChipStyle.filled(
              //     color: Colors.white,
              //     borderWidth: 10,
              //     borderRadius: BorderRadius.all(Radius.circular(18)),
              //     selectedStyle: const C2ChipStyle(
              //       backgroundColor: primaryColor,
              //       borderColor: Colors.red,
              //       borderWidth: 15,
              //       borderStyle: BorderStyle.solid
              //     ),
              //
              //     // backgroundColor: primaryColor,
              //     // borderRadius: BorderRadius.all(Radius.circular(18)),
              //     // overlayColor: Colors.transparent,
              //
              //
              //
              //   ),
              //
              //   value: _uiClassControllers.tag.value,
              //   onChanged: (val) => _uiClassControllers.changeTagValue(newValue: val),
              //   choiceItems: C2Choice.listFrom<int, String>(
              //
              //     source: options,
              //
              //     value: (i, v) => i,
              //     label: (i, v) => v,
              //   ),
              // )
            ],
          ),
        ) );
  }

  

  Container buildPowerUsageContainer() {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: primaryColor),
      height: 120,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: appPadding, right: appPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Power usage",
                  style: GoogleFonts.roboto(
                      color: white, fontSize: 12, fontWeight: FontWeight.w100),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      "210kWh",
                      style: GoogleFonts.roboto(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff5e9efe),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                          shape: BoxShape.circle),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 11,
                          color: white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Transform.rotate(
              angle: 116.5,
              child: const Icon(
                Icons.bolt_outlined,
                color: Color(0xff5e9efe),
                size: 130,
              ),
            )
          ],
        ),
      ),
    );
  }

  Column buildLIghtControlWIdget(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width / 3.5,
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
                        top: 3,
                        left: 8,
                      ),
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
                    Switch(value: true, onChanged: (value) {}),
                    const SizedBox(
                      width: 5,
                    ),
                    CommonComponents.buildCircledIconContainer(
                        icon: Icons.more_horiz,
                        bgColor: white,
                        iconColor: Colors.grey.shade700)
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FractionalTranslation(
            translation: const Offset(-0.1, 0),
            child: BuildSlider(sliderController: _sliderController)),
      ],
    );
  }
}


class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  const MultiSelectChip(this.reportList, {super.key});
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}
class _MultiSelectChipState extends State<MultiSelectChip> {
  String selectedChoice = "News";
  // this function will build and return the choice list
  _buildChoiceList() {
    List<Widget> choices = [];

    for (var item in widget.reportList) {
      bool isSelectedItem=selectedChoice==item;
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          selectedColor: primaryColor,
          backgroundColor: Colors.white,
          side:  BorderSide(color: Colors.grey.shade200),
          label: Text(item,style:TextStyle(color: isSelectedItem?white:black),),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
            });
          },
        ),
      ));
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}