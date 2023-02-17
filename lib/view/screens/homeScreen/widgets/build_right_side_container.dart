// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import '../../../../utils/colors.dart';
import '../../../../utils/constants.dart';
import '../../../components/common_comp.dart';

class BuildRightSideContainer extends StatelessWidget {
  const BuildRightSideContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.5),
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
                              colors: [Colors.transparent, Color(0xff134394)],
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
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.jpg"),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 40,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buiildTemperatureContainer(size),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: size.width / 4.5,
                decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(appPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildMusicDetailsContainer(),
                      const SizedBox(
                        height: 20,
                      ),
                      ProgressBar(
                        timeLabelLocation: TimeLabelLocation.sides,
                        progressBarColor: yellow900,
                        progress: const Duration(milliseconds: 1000),
                        buffered: const Duration(milliseconds: 2000),
                        total: const Duration(minutes: 1),
                        thumbColor: primaryColor,
                        thumbGlowRadius: 1,
                        onSeek: (duration) {
                          print('User selected a new time: $duration');
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonComponents.buildCircledIconContainer(
                              icon: Icons.skip_previous_outlined,
                              bgColor: grey.shade100,
                              iconColor: black,
                              circleRadius: 50,
                              shadowRequired: false),
                          Container(
                            height: 50,
                            width: size.width / 9,
                            decoration: const BoxDecoration(
                                color: primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: const Icon(
                              Icons.pause,
                              color: white,
                            ),
                          ),
                          CommonComponents.buildCircledIconContainer(
                              icon: Icons.skip_next_outlined,
                              bgColor: grey100,
                              iconColor: black,
                              circleRadius: 50,
                              shadowRequired: false)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Row buildMusicDetailsContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: white,
              boxShadow: [
                BoxShadow(
                  color: red,
                  blurRadius: 15,
                  offset: Offset(4, 8), // Shadow position
                ),
              ]),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
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
                    decoration: BoxDecoration(
                        border: Border.all(color: grey300),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Apple Homepod",
                        style: GoogleFonts.roboto(
                            decoration: TextDecoration.none,
                            color: grey600,
                            fontWeight: FontWeight.w900,
                            fontSize: 13),
                      ),
                    ),
                  ),
                  CommonComponents.buildCircledIconContainer(
                      icon: Icons.volume_down,
                      bgColor: white,
                      iconColor: grey400)
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
                    decoration: TextDecoration.none, color: grey, fontSize: 13),
              ),
            ],
          ),
        )
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
                    size: size,
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

  SizedBox buildFutureDateTemperature(
      {required String time, required String temp, required Size size}) {
    return SizedBox(
      width: size.width / 38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$time:00",
            style: GoogleFonts.roboto(
                decoration: TextDecoration.none, color: grey, fontSize: 13),
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
      ),
    );
  }
}
