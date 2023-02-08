// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:home_management_week6/constants/controller.dart';
import 'package:home_management_week6/helper/local_navigator.dart';
import 'package:home_management_week6/routing/routes.dart';
import 'package:home_management_week6/utils/colors.dart';
import 'package:home_management_week6/utils/constants.dart';
import 'package:home_management_week6/utils/style.dart';

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
        Container(
          decoration:  BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(3, 0), // changes position of shadow
                ),
              ],
              color: Color(0xff11a1fa),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25))),
          height: size.height,
          width: 250,
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
