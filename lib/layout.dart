import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: appPadding, top: appPadding / 2, bottom: appPadding / 2),
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
              Obx(() =>  Row(
                children: menuItems
                    .map((item) => buildToolBarItem(
                    itemTitle: item,
                    isEnabled: menuController.activeItem == item,
                    onPressed: (){menuController.chanegActiveIten(item);}))
                    .toList(),
              )) ,


              // buildToolBarItem(itemTitle: "Living Room", isEnabled: true),
              // buildToolBarItem(itemTitle: "Family Room", isEnabled: false),
              // buildToolBarItem(itemTitle: "Studio", isEnabled: false),
              // buildToolBarItem(itemTitle: "Kitchen", isEnabled: false),
              // buildToolBarItem(itemTitle: "Bedroom", isEnabled: false),
              // buildToolBarItem(itemTitle: "Garage", isEnabled: false),
            ],
          ),
        ),
        Expanded(
          child: localNavigator()
        )
      ],
    );
  }

  Widget buildToolBarItem(
      {required itemTitle,
      required isEnabled,
      required VoidCallback onPressed}) {
    return TextButton(
        onPressed:
          onPressed,

        child: Text(
          itemTitle,
          style: isEnabled ? toolBarEnabledItemStyle : toolBarDisabledItemStyle,
        ));
  }
}
