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
import 'package:home_management_week6/view/screens/homeScreen/widgets/build_right_side_container.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        buildMenuBar(),
        const BuildRightSideContainer(),
      ],
    );
  }

  Expanded buildMenuBar() {
    return Expanded(
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
