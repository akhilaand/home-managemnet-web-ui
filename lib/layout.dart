// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:home_management_week6/constants/controller.dart';
import 'package:home_management_week6/helper/local_navigator.dart';
import 'package:home_management_week6/routing/routes.dart';
import 'package:home_management_week6/utils/colors.dart';
import 'package:home_management_week6/utils/constants.dart';
import 'package:home_management_week6/utils/style.dart';
import 'package:home_management_week6/view/components/common_comp.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                color: const Color.fromRGBO(0, 0, 0, 0.03),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: appPadding,
                      top: appPadding / 2,
                      bottom: appPadding / 2),
                  child: Row(
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
                      Obx(() => Row(
                            children: menuItems
                                .map((item) => buildToolBarItem(
                                    itemTitle: item,
                                    isEnabled:
                                        menuController.activeItem == item,
                                    onPressed: () {
                                      menuController.chanegActiveIten(item);
                                    }))
                                .toList(),
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(child: localNavigator())
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(3, 0), // changes position of shadow
                    ),
                  ],
                  color: const Color(0xff114597),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25))),
              height: size.height,
              width: size.width / 4,
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20)),
                            child: Container(
                              foregroundDecoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Color(0xff134394)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.7, 1],
                                ),
                              ),
                              child: Image.asset(
                                "assets/images/bg.png",
                                height: 350,
                                fit: BoxFit.fitHeight,
                              ),
                            ))),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning",
                        style: GoogleFonts.roboto(
                            color: white,
                            fontWeight: FontWeight.w300,
                            fontSize: 22,
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        "Natasha",
                        style: GoogleFonts.roboto(
                            color: white,
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            decoration: TextDecoration.none),
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width / 12,
                  ),
                  const CircleAvatar()
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buiildTemperatureContainer(size),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 200,
                    width: size.width / 4.5,
                    decoration: const BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(appPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: 80,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.red,
                                          blurRadius: 15,
                                          offset:
                                              Offset(4, 8), // Shadow position
                                        ),
                                      ]),
                              child: ClipRRect(
                                borderRadius:  BorderRadius.all(Radius.circular(10)),
                                  child: Image.asset("assets/images/album.jpg")),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration:  BoxDecoration(
                                             border: Border.all(color: Colors.grey.shade300),
                                              borderRadius:
                                                  const BorderRadius.all(Radius.circular(20))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Apple Homepod",
                                              style: GoogleFonts.roboto(
                                                  decoration: TextDecoration.none,
                                                  color: Colors.grey.shade600,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ),
                                        CommonComponents.buildCircledIconContainer(icon: Icons.volume_down, bgColor: white, iconColor: grey400)

                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Loream",
                                      style: GoogleFonts.roboto(
                                          decoration: TextDecoration.none,
                                          color: black,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Vaundy",
                                      style: GoogleFonts.roboto(
                                          decoration: TextDecoration.none,
                                          color: Colors.grey.shade500,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Container buiildTemperatureContainer(Size size) {
    return Container(
      height: 200,
      width: size.width / 4.5,
      decoration: const BoxDecoration(
          color: white, borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(appPadding - 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "26°",
                      style: GoogleFonts.roboto(
                          decoration: TextDecoration.none,
                          color: black,
                          fontSize: 35),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Cloudy",
                      style: GoogleFonts.roboto(
                          decoration: TextDecoration.none,
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/cloud.png",
                  height: 50,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, index) => buildFutureDateTemperature(
                    time: (index + 10).toString(),
                    temp: (index + 22).toString()),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Column buildFutureDateTemperature(
      {required String time, required String temp}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$time:00",
          style: GoogleFonts.roboto(
              decoration: TextDecoration.none,
              color: Colors.grey.shade500,
              fontSize: 13),
        ),
        const SizedBox(
          height: 5.5,
        ),
        Image.asset(
          "assets/images/cloud.png",
          height: 25,
        ),
        const SizedBox(
          height: 5.5,
        ),
        Text(
          "$temp°",
          style: GoogleFonts.roboto(
              decoration: TextDecoration.none,
              color: black,
              fontSize: 13,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget buildToolBarItem(
      {required itemTitle,
      required isEnabled,
      required VoidCallback onPressed}) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          itemTitle,
          style: isEnabled ? toolBarEnabledItemStyle : toolBarDisabledItemStyle,
        ));
  }
}
