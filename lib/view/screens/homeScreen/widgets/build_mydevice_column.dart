// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:home_management_week6/controller/ui_controllers.dart';
import 'package:home_management_week6/modals/my_device_modal.dart';
import 'package:home_management_week6/utils/constants.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/style.dart';

class BuildMyDeviceColumn extends StatelessWidget {
  final UiClassControllers _uiClassControllers=Get.put(UiClassControllers());
   BuildMyDeviceColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("My Device",
                  style: toolBarEnabledItemStyle.copyWith(fontSize: 18)),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
                itemCount: _uiClassControllers.deviceList.length,
                itemBuilder: (context,index){
              return buildContainer(item: _uiClassControllers.deviceList[index]);
            }),
          ),
        ],
      ),
    ));
      
      
  }

  Obx buildContainer({required MyDeviceModal item}) {
    return Obx((){
      bool isHovered=_uiClassControllers.isHovering(item.deviceName);

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          onTap: (){},
          onHover: (value){
            value?_uiClassControllers.onHover(item.deviceName):_uiClassControllers.onHover("bsb");

          },
          hoverColor: primaryColor.withOpacity(0.3),
          child: Container(

            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 10,
                  ),
                ],
                color: _uiClassControllers.isHovering(item.deviceName)?Color(0xffe3eefc).withOpacity(0.1):white,
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.only(left: appPadding/2,top: appPadding,bottom: appPadding,right: appPadding+10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration:  BoxDecoration(
                        color: isHovered?primaryColor:Colors.grey.shade200,
                        borderRadius: const BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(item.icon,color: isHovered?white:black,),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(item.deviceName,
                      style: toolBarEnabledItemStyle.copyWith(fontSize: 15,color: isHovered?Colors.white:black)),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(item.deviceSubTitle,
                      style: GoogleFonts.roboto(color: isHovered?Colors.white:Colors.grey,fontSize: 12)),
                ],
              ),
            ),
          ),
        ),
      );
    } );
      
      
  }
}
