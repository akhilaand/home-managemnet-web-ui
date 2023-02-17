// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// Project imports:
import 'package:home_management_week6/modals/my_device_modal.dart';

class UiClassControllers extends GetxController {
  var selectedChoice = 0.obs;
  var hoverItem = "Indoor Cam".obs;

  List<MyDeviceModal> deviceList = [
    MyDeviceModal(
        icon: Icons.podcasts,
        deviceName: "Apple Homepod",
        deviceSubTitle: "Playing"),
    MyDeviceModal(
        icon: Icons.light,
        deviceName: "Smart Lamp",
        deviceSubTitle: "2 Lights"),
    MyDeviceModal(
        icon: Icons.camera_outdoor_rounded,
        deviceName: "Indoor Cam",
        deviceSubTitle: "On"),
    MyDeviceModal(
        icon: Icons.radio_button_on_sharp,
        deviceName: "Robot Vaccum",
        deviceSubTitle: "Off"),
    MyDeviceModal(
        icon: Icons.power, deviceName: "Smart Plug", deviceSubTitle: "On"),
  ].obs;

  changeTagValue({required int newValue}) {
    selectedChoice.value = newValue;
  }
  onHover(String itemName) {
     hoverItem.value = itemName;
  }
  isHovering(String itemName) {
    print(hoverItem.value == itemName);
    return hoverItem.value == itemName;
  }



}
