// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:home_management_week6/utils/constants.dart';
import '../../../../controller/slider_controller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/style.dart';
import '../../../components/common_comp.dart';
import 'build_multichip.dart';
import 'build_slider.dart';

// Package imports:

class BuildDeviceDetailRowContainer extends StatelessWidget {
  BuildDeviceDetailRowContainer({
    Key? key,
    required SliderController sliderController,
  })  : _sliderController = sliderController,
        super(key: key);

  final SliderController _sliderController;
  List<String> deviceList = [
    'Main Lamp',
    'Table Lamp',
  ];
  List<String> sceneList = ['None', 'Working', 'Reading'];

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
              color: grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ], color: white, borderRadius: BorderRadius.all(Radius.circular(15))),
          width: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildPowerUsageContainer(),
              // MultiSelectChip(options)
              const SizedBox(
                height: 5,
              ),
              buildControlSelectionWidget(
                  title: "Device", itemList: deviceList, isFirstWidget: true),
              buildControlSelectionWidget(
                  title: "Scene", itemList: sceneList, isFirstWidget: false),
              buildScheduleWIdget()
            ],
          ),
        ));
  }

  Padding buildScheduleWIdget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: appPadding / 2, vertical: appPadding / 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Schedule",
                  style: toolBarEnabledItemStyle.copyWith(fontSize: 16)),
              Text("Set always on",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600, fontSize: 13)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xffe1f2f5),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "6:00 pm",
                            style: GoogleFonts.roboto(color: white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "to",
                        style: GoogleFonts.roboto(),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "10:00 pm",
                            style: GoogleFonts.roboto(color: white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CommonComponents.buildCircledIconContainer(
                  icon: Icons.edit_calendar_rounded,
                  bgColor: const Color(0xfffc8c08),
                  iconColor: white)
            ],
          )
        ],
      ),
    );
  }

  Padding buildControlSelectionWidget(
      {required String title,
      required List<String> itemList,
      required isFirstWidget}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: appPadding / 2,
          vertical: isFirstWidget ? appPadding / 3 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: toolBarEnabledItemStyle.copyWith(fontSize: 16)),
              CommonComponents.buildCircledIconContainer(
                  icon: Icons.add,
                  bgColor: const Color(0xfffc8c08),
                  iconColor: white)
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          MultiSelectChip(itemList),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            color: grey200,
          )
        ],
      ),
    );
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
                              color: grey.withOpacity(0.5),
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
                        iconColor: grey700)
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
